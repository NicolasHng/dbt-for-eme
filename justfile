# Recettes de la formation. « just » seul affiche la liste.
set dotenv-load
set shell := ["bash", "-euc"]

# Afficher les recettes disponibles
default:
    @just --list --unsorted

# Démarrer la base et la plateforme de cours
demarrer: connexion
    docker compose up -d
    @echo "La formation est sur http://localhost:${APP_PORT:-8080}"

# Arrêter (ta progression est conservée)
arreter:
    docker compose down

# Mettre à jour le cours : le dépôt, puis l'image de la plateforme
maj: connexion
    git -c "http.https://github.com/.extraheader=Authorization: Basic $(printf '%s:%s' "$GITHUB_USER" "$GITHUB_TOKEN" | base64 -w0)" pull --rebase --autostash
    docker compose pull
    docker compose up -d
    @echo "Cours à jour."

# Voir ce qui tourne
etat:
    docker compose ps

# Suivre les journaux de la plateforme (Ctrl+C pour quitter)
journaux:
    docker compose logs -f app

# Se connecter au registre GitHub avec le jeton du .env
connexion:
    @if [ -z "${GITHUB_USER:-}" ] || [ -z "${GITHUB_TOKEN:-}" ]; then echo "Renseigne GITHUB_USER et GITHUB_TOKEN dans le fichier .env." >&2; exit 1; fi
    @echo "$GITHUB_TOKEN" | docker login ghcr.io -u "$GITHUB_USER" --password-stdin >/dev/null && echo "Connectée au registre GitHub."
