%option noyywrap
%{
#include"y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+ {return NUMBER;}
[a-zA-Z][a-zA-Z0-9_]* {return ID;}
\n {return NL;}
. {return yytext[0];}
%%