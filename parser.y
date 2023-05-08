%{
  #include<stdio.h>
  int yylex();
  void yyerror(const char *s) { printf("ERROR: %sn", s); }
%}

%token IDENTIFIER STRING INTEGER FLOAT
%token IF ELSE WHILE FOR RETURN
%token PLUS MINUS MULT DIV
%token AND OR 
%token EQUAL EQUAL_TO NOT_EQUAL_TO LESS_THAN GREATER_THAN LESS_THAN_EQUAL_TO GREATER_THAN_EQUAL_TO
%token OPEN_PAR CLOSE_PAR SEMI_COLON COMMA OPEN_KEY CLOSE_KEY
%token INT_TYPE BOOL_TYPE FLOAT_TYPE TEXT_TYPE 
%token TRUE FALSE

%start program

%%

program: statement_list
    ;

block : OPEN_KEY statement_list CLOSE_KEY
      | OPEN_KEY CLOSE_KEY
      ;

statement_list : statement
               | statement_list statement
               ;

statement : assignment
          | block
          | print
          | if
          | while
          | return
          SEMI_COLON
          ;

relexpression : expression EQUAL_TO expression
              | expression NOT_EQUAL_TO expression
              | expression LESS_THAN expression
              | expression GREATER_THAN expression
              | expression LESS_THAN_EQUAL_TO expression
              | expression GREATER_THAN_EQUAL_TO expression
              ;

expression : term PLUS expression
           | term MINUS expression
           | term
           ;

term : factor MULT term
     | factor DIV term
     | factor
     ;

factor : INTEGER
       | STRING
       | FLOAT
       | IDENTIFIER
       | PLUS factor
       | MINUS factor
       | NOT factor
       | OPEN_PAR expression CLOSE_PAR
       ;

assignment: TYPE IDENTIFIER EQUAL relexpression SEMI_COLON
          ;
print: PRINT OPEN_PAR relexpression CLOSE_PAR SEMI_COLON
     ;
if: IF OPEN_PAR relexpression CLOSE_PAR statement
  | IF OPEN_PAR relexpression CLOSE_PAR statement else
  ;
else: ELSE statement
    ;
while: WHILE OPEN_PAR relexpression CLOSE_PAR OPEN_KEY block CLOSE_KEY
     ;
type_var: VAR_TYPE IDENTIFIER SEMI_COLON
        | COMMA IDENTIFIER SEMI_COLON
        ;

%%

int main() {
  yyparse();
  return 0;
}
```