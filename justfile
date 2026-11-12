# Recettes de la formation. « just » seul affiche la liste.
set dotenv-load
set shell := ["bash", "-euc"]

[private]
default:
    @just --list --unsorted

# Démarrer la base et la plateforme de cours
demarrer:
    docker compose up -d
    @echo "La formation est sur http://localhost:${APP_PORT:-8080}"

# Arrêter (ta progression est conservée)
arreter:
    docker compose down

# Mettre à jour le cours : le dépôt, puis l'image de la plateforme
maj:
    git pull --rebase --autostash
    docker compose pull
    docker compose up -d
    @echo "Cours à jour."

# Voir ce qui tourne
etat:
    docker compose ps

# Suivre les journaux de la plateforme (Ctrl+C pour quitter)
journaux:
    docker compose logs -f app
