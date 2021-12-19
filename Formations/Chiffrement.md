# Chiffrement 

## Algorithme RSA

![image](chiffrement_rsa.png)

### Choix clé publique et clé privée

* Choix de deux nombres premiers p et q
* Calcul de n = p*q
* Calcul de phi(n) = (p - 1)(q - 1)
        ```
        p=5, q=17
        n=p*q=85
        phi(n)=(p-1)(q-1)=(5-1)(17-1)=64
        ```
* Choix d’un exposant et calcul de son inverse
    * Choix d’un exposant e tel que pgcd(n, phi(n))=1
    * Calcul l’inverse d de e modulo phi(n) par l’algorithme euclide étendu d*e=1 (modulo phi(n))
        ```
Choix 
        Choix de e=5 et on a bien pgcd(e, phi(n)) = pgcd(5, 64)=1
        5*13+64*(-1) = 1
         5*13=1 (mod 64)
        l’inverse de e modulo phi(n) est d=13
        ```
* Clé publique consitué de n et e
* Clé privée constitué de d

### Chiffrement du message 

* Il transforme son message en un ou plusieurs entier m
* L’entier doit verifier 0 <= m < n 
* Pour l’exemple m=10
* Calcul du message chiffré x=m^e (mod n)
        ```
        m=10, n=85, et e=5
        x=m^e (mod n)=10^5 (mod 85) = 40
        ```
### Déchiffrement du message
* Calcul avec m=x^d (mod n)
        ```
        x=40, d=13, n=85
        m = 40^13 (mod 85) = 10 le message d’origine
        ```