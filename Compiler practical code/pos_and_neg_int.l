%{ 
 #include<stdio.h> 
 int posint=0, negint=0,posfraction=0, negfraction=0; 
%} 
%% 
[-][0-9]+ {negint++;} 
[+]?[0-9]+ {posint++;} 
[+]?[0-9]*\.[0-9]+ {posfraction++;} 
[-][0-9]*\.[0-9]+ {negfraction++;} 
%% 
int yywrap() 
{ 
return 1; 
} 
main(int argc, char *argv[]) 
{ 
 if(argc!=2) 
 { 
 printf("Usage: <./a.out> <sourcefile>\n"); 
 exit(0); 
 } 
 yyin=fopen(argv[1],"r"); 
yylex(); 
printf("No of +ve integers=%d\n No of –ve integers=%d\n No of +ve fractions=%d\n No of –ve fractions=%d\n", posint, negint, posfraction, negfraction); 
}