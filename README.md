<div align="center">

# 🌳 Baobab

**Le premier langage de programmation moderne en français**

*The first modern French-first programming language*

[![PyPI](https://img.shields.io/pypi/v/baobab-lang?color=4CAF50&label=PyPI&logo=python&logoColor=white)](https://pypi.org/project/baobab-lang/)
[![Python](https://img.shields.io/badge/Python-3.13+-3776AB?logo=python&logoColor=white)](https://www.python.org/downloads/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://baobablang.dev)
[![VS Code](https://img.shields.io/badge/VS%20Code-Extension-007ACC?logo=visualstudiocode&logoColor=white)](https://marketplace.visualstudio.com/items?itemName=baobablang.baobab-lang)
[![Website](https://img.shields.io/badge/Website-baobablang.dev-4CAF50)](https://baobablang.dev)

[🌐 Site officiel](https://baobablang.dev) •
[📚 Documentation](https://baobablang.dev/docs) •
[💻 Studio en ligne](https://baobablang.dev/ide) •
[📦 PyPI](https://pypi.org/project/baobab-lang/)

</div>

---

## Installation rapide

```bash
curl -fsSL get.baobablang.dev | sh
```

> **Prérequis :** Python 3.13+ - [télécharger](https://www.python.org/downloads/)

Ou manuellement avec pipx :

```bash
pipx install baobab-lang
```

Ou avec pip :

```bash
pip install baobab-lang
```

Vérifier l'installation :

```bash
bao --version
# → bao 0.1.0
```

---

## Qu'est-ce que Baobab ?

Baobab est un langage de programmation moderne conçu pour **apprendre et enseigner la programmation en français**. Il utilise une syntaxe inspirée de Python, avec des mots-clés entièrement en français - sans accent, pour une saisie facile sur tous les claviers.

```baobab
# Mon premier programme en Baobab

fonction saluer(nom):
    afficher("Bonjour " + nom + " 👋")

pour nom dans ["Amina", "Kofi", "Seidy"]:
    saluer(nom)
```

```
Bonjour Amina 👋
Bonjour Kofi 👋
Bonjour Seidy 👋
```

---

## Pourquoi Baobab ?

| | Python | Baobab |
|---|---|---|
| Mots-clés | Anglais (`def`, `if`, `for`) | Français (`fonction`, `si`, `pour`) |
| Builtins | `print()`, `len()`, `range()` | `afficher()`, `longueur()`, `intervalle()` |
| Messages d'erreur | Anglais | Français & Anglais |
| Compatibilité Python | - | ✅ Traduction bidirectionnelle |
| Courbe d'apprentissage | Barrière de la langue | Naturel en français |

Baobab **transpile vers Python** - tout programme Baobab est convertible en Python lisible, et vice-versa.

---

## Commandes essentielles

### Lancer un programme

```bash
bao run programme.bao
```

### Traduire Baobab → Python

```bash
bao translate programme.bao --to python
```

### Traduire Python → Baobab

```bash
bao translate programme.py --to bao
```

### Construire (transpiler un dossier entier)

```bash
bao build src/ -o dist/
```

### Formater le code

```bash
bao format programme.bao
```

### Lancer les tests

```bash
bao test tests/
```

> Pour plus de détails, consultez : https://baobablang.dev/docs/cli
---

## Exemples de code

### Hello World

```baobab
afficher("Bonjour le monde ! 🌍")
```

### Fonctions

```baobab
fonction aire_rectangle(largeur, hauteur):
    retourner largeur * hauteur

afficher(aire_rectangle(5, 3))  # → 15
```

### Conditions

```baobab
age = entier(lire("Votre âge : "))

si age >= 18:
    afficher("Majeur ✓")
sinonsi age >= 13:
    afficher("Adolescent")
sinon:
    afficher("Enfant")
```

### Boucles

```baobab
# Boucle pour
pour i dans intervalle(5):
    afficher(i)

# Boucle tant que
compteur = 0
tantque compteur < 3:
    afficher("compteur =", compteur)
    compteur = compteur + 1
```

### Listes et dictionnaires

```baobab
# Liste
fruits = ["pomme", "banane", "mangue"]
pour fruit dans fruits:
    afficher(fruit.majuscules())

# Dictionnaire
etudiant = {"nom": "Amina", "note": 18}
afficher(etudiant["nom"], "→", etudiant["note"], "/20")
```

### Classes

```baobab
classe Animal:
    fonction nouveau(ce, nom, son):
        ce.nom = nom
        ce.son = son

    fonction parler(ce):
        afficher(ce.nom + " dit : " + ce.son)

chien = Animal("Rex", "Woof!")
chien.parler()  # → Rex dit : Woof!
```

### Gestion d'erreurs

```baobab
essayer:
    nombre = entier(lire("Entrez un nombre : "))
    afficher("Le double est :", nombre * 2)
attraper ErreurValeur comme e:
    afficher("Ce n'est pas un nombre valide.")
```

### Fibonacci

```baobab
fonction fibonacci(n):
    si n <= 0:
        retourner []
    sinonsi n == 1:
        retourner [0]
    suite = [0, 1]
    tantque longueur(suite) < n:
        suite.ajouter(suite[-1] + suite[-2])
    retourner suite

afficher(fibonacci(10))
# → [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
```

### Modules

```baobab
importer aleatoire

nombre = aleatoire.entier(1, 100)
afficher("Nombre aléatoire :", nombre)
```

---

## Référence des mots-clés

| Baobab | Python | Description |
|---|---|---|
| `fonction` | `def` | Déclarer une fonction |
| `si` | `if` | Condition |
| `sinonsi` | `elif` | Sinon si |
| `sinon` | `else` | Sinon |
| `pour` | `for` | Boucle pour |
| `dans` | `in` | Dans (itération) |
| `tantque` | `while` | Boucle tant que |
| `retourner` | `return` | Retourner une valeur |
| `classe` | `class` | Déclarer une classe |
| `essayer` | `try` | Essayer (exception) |
| `attraper` | `except` | Attraper une exception |
| `enfin` | `finally` | Enfin |
| `lever` | `raise` | Lever une exception |
| `vrai` | `True` | Vrai |
| `faux` | `False` | Faux |
| `nul` | `None` | Nul / vide |
| `et` | `and` | Et logique |
| `ou` | `or` | Ou logique |
| `non` | `not` | Non logique |
| `importer` | `import` | Importer un module |
| `depuis` | `from` | Depuis un module |
| `casser` | `break` | Casser une boucle |
| `continuer` | `continue` | Continuer |
| `passer` | `pass` | Passer |

## Builtins principaux

| Baobab | Python | Description |
|---|---|---|
| `afficher()` | `print()` | Afficher |
| `lire()` | `input()` | Lire une saisie |
| `longueur()` | `len()` | Longueur |
| `intervalle()` | `range()` | Intervalle |
| `entier()` | `int()` | Convertir en entier |
| `decimal()` | `float()` | Convertir en décimal |
| `texte()` | `str()` | Convertir en texte |
| `liste()` | `list()` | Convertir en liste |
| `trie()` | `sorted()` | Trier |
| `enumerer()` | `enumerate()` | Énumérer |
| `somme()` | `sum()` | Somme |
| `absolu()` | `abs()` | Valeur absolue |
| `arrondir()` | `round()` | Arrondir |

---

## Extension VS Code

L'extension Baobab pour VS Code ajoute la coloration syntaxique, les snippets
et le bouton ⚡ pour exécuter directement depuis l'éditeur.

**Installer depuis VS Code :**

`Cmd+Shift+X` → rechercher **"Baobab"** → Installer

**Ou depuis le terminal :**

```bash
code --install-extension baobablang.baobab-lang
```

Fonctionnalités :
- 🎨 Coloration syntaxique complète
- ⚡️ Bouton Run (Cmd+F5) - supporte `lire()` interactif
- 📝 22 snippets (`fonction`, `si`, `pour`, `classe`...)
- ⚙️ Indentation automatique, repli de code

---

## Studio en ligne

Essayez Baobab sans installation sur **[baobablang.dev/ide](https://baobablang.dev/ide)** :

- Éditeur de code complet dans le navigateur
- Exécution en temps réel
- Traduction Baobab ↔ Python
- Sauvegarde de projets
- Assistant IA

---

## Désinstaller

```bash
pipx uninstall baobab-lang
```

---

## Support

- **Documentation :** [baobablang.dev/docs](https://baobablang.dev/docs)
- **Problèmes :** [contact@baobablang.dev](mailto:contact@baobablang.dev)
- **Discord :** [discord.gg/baobablang](https://discord.gg/baobablang)

---

## Licence

MIT - © 2026 [Wontan SAS](https://baobablang.dev)

---

<div align="center">

**Fait avec 🌳 par l'équipe Baobab**

[baobablang.dev](https://baobablang.dev)

</div>
