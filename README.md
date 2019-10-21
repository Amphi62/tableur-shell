# tableur-shell

## Partie mise en place - Ajout de vérification
- Vérifier que les séparateur de colonne et de ligne sont bien un seul caractère

## Partie fonction - transcription résultat dans nouveau fichier
Passer de la feuille de calcul à la feuile résultat (cas de deux fichiers externes)

copie feuille de calcul --> feuille résultat

dans feuille résultat, faire :
-> parcourir lignes par lignes
[Parcourir lignes par lignes :]
1ere ligne : 
```Shell
`head -n 1 "$file_out" | tail -n 1`
```
2e ligne : 
```Shell
`head -n 2 "$file_out" | tail -n 1`
```
...
ième ligne : 
```Shell
`head -n "$i" "$file_out" | tail -n 1`
```

[Parcourir en colonne :]
col 1 => ... | cut -d: -f1
col 2 => ... | cut -d: -f2
...

-d: => on met le ":" car l'exemple traitait des ":" en séparateur de colonne, mais il s'agit bien de ça normalement


On vérifie ensuite dans chaque case la présence d'un égal en début de case, si ce n'est pas le cas, on ne fait rien, sinon :
-> a venir


## Partie fonction - les fonctions de calculs
- [cel] => on vérifie bien le nombre de paramètre qu'on passera à notre fonction permettant la récupération de notre valeur.
Pour analyser les coordonnées, on utilise sed :
```Shell
lig=`echo $1 | sed -E 's/^l([0-9]+)c[0-9]+$/\1/g'`
col=`echo $1 | sed -E 's/^l[0-9]+c([0-9]+)$/\1/g'`
```

=> on vérifie bien que la récupération c'est bien déroulé :
s'il y a eu un soucis avec sed (la ligne / colonne n'a pas été ou mal renseigné), alors lig/col possédera la valeur de $1 qui correspond à notre paramètre de fonction cel, donc il suffira de regarder si lig != cel et col != cel pour savoir si tous c'est bien déroulé ou non.


- Somme, différence, produit, quotien, élevé a la puissance : peut se faire en une seule fonction. Nécessite de la récursivité, dans le cas où le(s) paramètre(s) et lui même un calcul, ou une référence à une cellule. 
Comment le détecter ? 
L'algorithme principale de ses fonctions est quasiment celle de l'exemple situé en page 4 du sujet.
