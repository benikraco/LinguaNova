%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s){
    printf("Erro sintático: %s\n", s);
    exit(1);};
%}


%token FUNCAO IMPRIME SE SENAO ENQUANTO RETORNA E OU
%token SOMA SUBTRACAO MULTIPLICACAO DIVISAO
%token IGUAL MAIOR MENOR MAIOR_IGUAL MENOR_IGUAL DIFERENTE
%token PONTO_E_VIRGULA ABRE_PARENTESE FECHA_PARENTESE ABRE_CHAVES FECHA_CHAVES VIRGULA ATRIBUICAO
%token NUMERO IDENTIFICADOR STRING

%%

programa: 
    /* vazio */ 
    | programa declaracao 
    ;

declaracao:
    atribuicao PONTO_E_VIRGULA
    | impressao PONTO_E_VIRGULA
    | condicional
    | laco
    | funcao
    | chamada_funcao PONTO_E_VIRGULA
    ;

declaracoes:
    /* vazio */
    | declaracoes declaracao
    ;

atribuicao:
    IDENTIFICADOR ATRIBUICAO expressao PONTO_E_VIRGULA
    ;

impressao:
    IMPRIME ABRE_PARENTESE expressao FECHA_PARENTESE PONTO_E_VIRGULA
    ;

condicional:
    SE ABRE_PARENTESE condicao FECHA_PARENTESE bloco
    | SE ABRE_PARENTESE condicao FECHA_PARENTESE bloco SENAO bloco
    ;

laco:
    ENQUANTO ABRE_PARENTESE condicao FECHA_PARENTESE bloco
    ;

funcao:
    FUNCAO IDENTIFICADOR ABRE_PARENTESE parametros FECHA_PARENTESE bloco
    ;

chamada_funcao:
    IDENTIFICADOR ATRIBUICAO IDENTIFICADOR ABRE_PARENTESE argumentos FECHA_PARENTESE
    ;

bloco:
    ABRE_CHAVES declaracoes FECHA_CHAVES 
    | ABRE_CHAVES declaracoes retorno FECHA_CHAVES
    ;

retorno:
    RETORNA expressao PONTO_E_VIRGULA
    RETORNA PONTO_E_VIRGULA
    ;

parametros:
    /* vazio */
    | lista_identificadores
    ;

argumentos:
    /* vazio */
    | lista_expressoes
    ;

condicao:
    expressao
    ;

lista_identificadores:
    IDENTIFICADOR
    | lista_identificadores VIRGULA IDENTIFICADOR
    ;

lista_expressoes:
    expressao
    | lista_expressoes VIRGULA expressao
    ;

expressao:
    termo
    | expressao operador_aditivo termo
    ;

termo:
    fator
    | termo operador_multiplicativo fator
    ;

fator:
    NUMERO
    | IDENTIFICADOR
    | chamada_funcao
    | ABRE_PARENTESE expressao FECHA_PARENTESE
    ;

operador_aditivo:
    SOMA
    | SUBTRACAO
    ;

operador_multiplicativo:
    MULTIPLICACAO
    | DIVISAO
    ;

%%

int main(void) {
    yyparse();
}
