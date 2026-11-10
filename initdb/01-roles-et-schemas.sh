#!/bin/bash
# Exécuté une seule fois, à la création du volume Postgres.
#
# - plateforme (l'app) : propriétaire de `bronze` (données fournies) et de `plateforme` (son état interne).
# - emeline (dbt)    : lit `bronze`, crée ses propres schémas, ne voit pas `plateforme`.
set -euo pipefail

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" \
  -v emeline_password="$EMELINE_PASSWORD" <<'SQL'
CREATE ROLE emeline LOGIN PASSWORD :'emeline_password';

-- Le schéma public par défaut n'est pas utilisé.
REVOKE ALL ON SCHEMA public FROM PUBLIC;

-- dbt doit pouvoir créer ses schémas (staging, intermediate, marts...)
GRANT CONNECT, CREATE ON DATABASE formation TO emeline;

-- Les sources : lecture seule pour Emeline, y compris les tables créées plus tard.
CREATE SCHEMA bronze;
GRANT USAGE ON SCHEMA bronze TO emeline;
ALTER DEFAULT PRIVILEGES IN SCHEMA bronze GRANT SELECT ON TABLES TO emeline;

-- L'état de la plateforme : invisible pour Emeline.
CREATE SCHEMA plateforme;
REVOKE ALL ON SCHEMA plateforme FROM PUBLIC;
SQL
