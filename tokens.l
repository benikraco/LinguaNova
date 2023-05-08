%{
#include <stdio.h>
#include <string.h>
#include "parser.tab.h"
%}

%%

[ \t\n]                 ;
[a-zA-Z][a-zA-Z0-9]     return IDENTIFIER;
[a-zA-Z0-9]             return STRING;
[0-9]+[.][0-9]+         return FLOAT;
[0-9]+                  return INTEGER;

"enquanto"              return WHILE;
"se-"                   return IF;
"senao"                 return ELSE;
"imprimir"              return PRINT;
"retornar"              return RETURN;

"="                     return EQUAL;
"=="                    return EQUAL_TO;
"!"                     return NOT;
"+"                     return PLUS;
"-"                     return MINUS;
"*"                     return MULT;
"/"                     return DIV;
"e_op"                  return AND;
"||"                    return OR;
">"                     return GREATER_THAN;
"<"                     return LESS_THAN;
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
