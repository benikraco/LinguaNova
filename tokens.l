%{
#include "parser.tab.h"
%}

%%

"funcao"   return FUNCAO; 
"imprime"  return IMPRIME; 
"se"  return SE; 
"senao"  return SENAO; 
"enquanto"  return ENQUANTO; 
"retorna"  return RETORNA; 
"e"  return E; 
"ou"  return OU; 

"+"  return SOMA; 
"-"  return SUBTRACAO; 
"*"  return MULTIPLICACAO; 
"/"  return DIVISAO; 

"=="  return IGUAL; 
">"  return MAIOR; 
"<"  return MENOR; 
">="  return MAIOR_IGUAL; 
"<="  return MENOR_IGUAL; 
"!="  return DIFERENTE; 

";"  return PONTO_E_VIRGULA; 
"("  return ABRE_PARENTESE; 
")"  return FECHA_PARENTESE; 
"{"  return ABRE_CHAVES; 
"}"  return FECHA_CHAVES; 
","  return VIRGULA; 
"="  return ATRIBUICAO; 

[0-9]+ return NUMERO;
[a-zA-Z][a-zA-Z0-9_]*  return IDENTIFICADOR; 
\"[^"]*\"   return STRING;

[ \t\n] /* ignore whitespace */ 
.  printf("Caracter inválido: %s\n", yytext); 

%%
