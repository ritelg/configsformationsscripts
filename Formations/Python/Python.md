# Doc Python

### List Slices
```
squares = [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
print(squares[2:6])
print(squares[3:8])
print(squares[0:1])
sud
>>>
[4, 9, 16, 25]
[9, 16, 25, 36, 49]
[0]
>>>


squares = [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
print(squares[:7])
print(squares[7:])

>>>
[0, 1, 4, 9, 16, 25, 36]
[49, 64, 81]
>>>
```

### Tuples (ne peut pas etre changer)
```
words = ("spam", "eggs", "sausages",)
```

### Dictionnaire
```
{2: 4, 3: 9, 4: 16,}
```

### String
```
minuscules = "une chaine en minuscules"
minuscules.upper() # Mettre en majuscules
'UNE CHAINE EN MINUSCULES'
minuscules.capitalize() # La première lettre en majuscule
'Une chaine en minuscules'
espaces = "   une  chaine avec  des espaces   "
espaces.strip() # On retire les espaces au début et à la fin de la chaîne
'une  chaine avec  des espaces'
titre = "introduction"
titre.upper().center(20)
'    INTRODUCTION    '

```
