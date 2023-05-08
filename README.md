# LinguaNova

## EBNF

```lua
BLOCK = "{", {STATEMENT}, "}";

STATEMENT = VARIABLE_ASSIGNMENT | PRINT | IF_STATEMENT | WHILE_STATEMENT | RETURN_STATEMENT ;

VARIABLE_ASSIGNMENT = IDENTIFIER, "=" RELEXPRESSION, ";" ;
PRINT = "imprimir" "(" RELEXPRESSION, ");" ;
IF_STATEMENT = "se" "(" RELEXPRESSION, ")" "{" STATEMENT, "}" {"senao" "{" STATEMENT, "}"} ;
WHILE_STATEMENT = "enquanto" "(" RELEXPRESSION, ")" "{" STATEMENT, "}" ;
FUNCTION_DEFINITION = "df" IDENTIFIER, "(" {IDENTIFIER, {","}, (":"), TYPE, ")"}, ")" BLOCK ;
VARIABLE_DEFINITION = "var" IDENTIFIER, {",", IDENTIFIER}, ":", TYPE, ";" ;
RETURN_STATEMENT = "retornar" RELEXPRESSION, ";" ;

EXPRESSION = TERM, {("+" | "-") TERM} | LOGICAL ;
TERM = FACTOR, {("*" | "/" | "&&") FACTOR} ;
FACTOR = NUMBER | STRING | IDENTIFIER | ("+" | "-" | "!") FACTOR | "(" RELEXPRESSION, ")" ;
RELEXPRESSION = FACTOR, ("igual" | "diferente" | "menor_que" | "menor_igual" | "maior_que" | "maior_igual") FACTOR ;
LOGICAL = COMPARISON, {("e" | "ou") COMPARISON} ;

IDENTIFIER = LETTER, {LETTER | DIGIT | "_"} ;
LETTER = (("a" .. "z") | ("A" .. "Z")) ;
DIGIT = ("0" .. "9") ;
NUMBER = DIGIT, {DIGIT} [ "." DIGIT, {DIGIT} ] ;
STRING = """, { {LETTER | DIGIT | "_"} | SPACE }, """ ;
SPACE = " ";
TYPE = "int" | "bool" | "texto" ;

```
  