# dbt : zero to hero

Prérequis : WSL (Ubuntu), Docker, et un accès en lecture au registre GitHub (`docker login ghcr.io`, avec un jeton
qui a le droit `read:packages`). Depuis le terminal Ubuntu :

```bash
git clone https://github.com/NicolasHng/dbt-for-eme.git ~/formation-dbt
cd ~/formation-dbt
cp .env.example .env
docker compose up -d
```

Puis ouvre http://localhost:8080 : tout le reste se passe dans le cours.

- Arrêter : `docker compose down` (ta progression est conservée).
- Mettre à jour le cours : `git pull && docker compose pull && docker compose up -d`.
- Tout recommencer : `docker compose down -v`.
- Ton projet dbt est dans `projet-dbt/`.
