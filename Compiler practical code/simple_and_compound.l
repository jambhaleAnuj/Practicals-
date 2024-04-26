%{ 
 #include<stdio.h> 
 int is_simple=1; 
%} 
%% 
[ \t\n]+[aA][nN][dD][ \t\n]+ {is_simple=0;} 
[ \t\n]+[oO][rR][ \t\n]+ {is_simple=0;} 
[ \t\n]+[bB][uU][tT][ \t\n]+ {is_simple=0;} 
. {;} 
%% 
int yywrap() 
{ 
return 1; 
} 
main() 
{ 
 int k; 
 printf("Enter the sentence.. at end press ^d\n"); 
 yylex(); 
if(is_simple==1) 
 { 
 printf("The given sentence is simple"); 
 } 
else 
 { 
 printf("The given sentence is compound"); 
 }
 }