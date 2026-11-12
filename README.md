# dbt : zero to hero

Prérequis : WSL (Ubuntu), Docker et just.
Depuis le terminal Ubuntu :

```bash
git clone https://github.com/NicolasHng/dbt-for-eme.git ~/formation-dbt
cd ~/formation-dbt
cp .env.example .env
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
