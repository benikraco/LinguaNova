%{
#include <stdio.h>
#include <string.h>
#include "parser.tab.h"
%}

%%

[ \t\n]                 ;
[a-zA-Z][a-zA-Z0-9]     return IDENTIFIER;
[a-zA-Z0-9]             return STRING;
[0-9]+                  return INTEGER;
[0-9]+[.][0-9]+         return FLOAT;


"enquanto"              return WHILE;
"se"                    return IF;
"senao"                 return ELSE;
"imprimir"              return PRINT;
"df"                    return FUNC_TYPE;
"retornar"              return RETURN;
"para"                  return FOR;

"="                     return EQUAL;
"+"                     return PLUS;
"-"                     return MINUS;
"*"                     return MULT;
"/"                     return DIV;
"e"                     return AND;
"ou"                    return OR;
"igual"                 return EQUAL_TO;
"diferente"             return NOT_EQUAL_TO;
"maior_que"             return GREATER_THAN;
"menor_que"             return LESS_THAN;
"maior_igual"           return GREATER_THAN_EQUAL_TO;
"menor_igual"           return LESS_THAN_EQUAL_TO;
"("                     return OPEN_PAR;
")"                     return CLOSE_PAR;
";"                     return SEMI_COLON;
","                     return COMMA;
"{"                     return OPEN_KEY;
"}"                     return CLOSE_KEY;

"int"                   return INT_TYPE;
"bool"                  return BOOL_TYPE;
"texto"                 return TEXT_TYPE;
"verdadeiro"            return TRUE;
"falso"                 return FALSE;

.                       printf("Unknown token!n"); yyterminate();

%%
