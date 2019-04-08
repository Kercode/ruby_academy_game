Ce fichier README précise la démarche à suivre pour lancer le script.

### Lisibilité

Afin d'améliorer la lisibilité du code je l'ai organisé dans plusieurs fichiers dans le dossier `lib` (convention utilisée lors de la création de gem). J'ai simplement gardé la boucle dans le fichier `main.rb`.

### Contenu

Afin de rendre le contenu éditable, je l'ai externalisé dans un fichier `contenu.yml` qui est appelé au travers des différentes constantes.

### Idiome

Afin d'avoir un code idiomatique j'ai préféré remplacer l'attribut `en_vie` par une méthode d'instance `vivant?` qui est plus "Ruby way".

## Lancement du script

Ici rien d'exceptionnel, il suffit simplement de changer `jeu.rb` en `main.rb` :

```shell
ruby main.rb
```


