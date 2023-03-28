# LinguaNova

## EBNF

```lua
LinguaNova = {INSTRUCTIO} ;

INSTRUCTIO = VARIABILE | IMPRESSIO | SIINSTRUCTIO | DUMINSTRUCTIO | FUNCTIODEFINITIO | RETURNINSTRUCTIO ;

VARIABILE = IDENTIFIER "=" EXPRESSIO ;
IMPRESSIO = "imprimo" "(" EXPRESSIO ")" ;
SIINSTRUCTIO = "si" "(" EXPRESSIO ")" ":" {INSTRUCTIO} ["alioquin" ":" {INSTRUCTIO}] ;
DUMINSTRUCTIO = "dum" "(" EXPRESSIO ")" ":" {INSTRUCTIO} ;
FUNCTIODEFINITIO = "functio" IDENTIFIER "(" [IDENTIFIER {"," IDENTIFIER}] ")" ":" {INSTRUCTIO} ;
RETURNINSTRUCTIO = "redde" "(" EXPRESSIO ")" ;

EXPRESSIO = TERMINUS {("+" | "-") TERMINUS} | LOGICAL ;
TERMINUS = FACTUM {("*" | "/") FACTUM} ;
FACTUM = NUMERUS | IDENTIFIER | "(" EXPRESSIO ")" | UNARYOP FACTUM | IDENTIFIER "(" [EXPRESSIO {"," EXPRESSIO}] ")" ;
UNARYOP = "+" | "-" | "!" | "non" ;

COMPARATIO = EXPRESSIO ("==" | "!=" | "<" | "<=" | ">" | ">=") EXPRESSIO ;
LOGICAL = COMPARATIO {("et" | "vel") COMPARATIO} ;

IDENTIFIER = LITTERA {LITTERA | CIFRA} ;
LITTERA = ("a" | ... | "z" | ... | "A" | ... | "Z" ) ;
CIFRA = ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9") ;

NUMERUS = [ "-" ] CIFRA {CIFRA} [ "." CIFRA {CIFRA} ] ;
```
  
