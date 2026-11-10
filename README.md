# dbt : zero to hero

Prérequis : WSL (Ubuntu), Docker, just, et un jeton d'accès GitHub classique (droits `repo` et `read:packages`).
Depuis le terminal Ubuntu :

```bash
git clone https://github.com/NicolasHng/dbt-for-eme.git ~/formation-dbt   # mot de passe : ton jeton
cd ~/formation-dbt
cp .env.example .env      # puis renseigne GITHUB_USER et GITHUB_TOKEN dans .env
just demarrer
```

Puis ouvre http://localhost:8080 : tout le reste se passe dans le cours.

| Recette | Effet |
|---|---|
| `just demarrer` | Démarre la base et la plateforme |
| `just arreter` | Arrête tout (ta progression est conservée) |
| `just maj` | Met à jour le cours (dépôt et image) |
| `just etat` | Montre ce qui tourne |
| `just journaux` | Suit les journaux de la plateforme |

Ton projet dbt est dans `projet-dbt/`.
