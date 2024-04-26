%{ 
#include<stdio.h> 
int pc=0, sc=0; 
%} 
%% 
"printf" { fprintf(yyout,"writef"); pc++;} 
"scanf" { fprintf(yyout,"readf"); sc++;} 
%% 
int yywrap() 
{ 
return 1; 
} 
main(int argc, char *argv[]) 
{ 
 if(argc!=2) 
 { 
 printf("Usage: <./a.out> <sourcefile> <destn file>\n"); 
 exit(0); 
 } 
 yyin=fopen(argv[1],"r"); 
 yyout=fopen(argv[2],"w"); 
 yylex(); 
 printf("No of printf statements = %d\n No of scanf statements=%d\n", pc, sc); 
}