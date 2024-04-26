%{ 
 #include<stdio.h> 
 int c=0, w=0, s=0, l=0; 
%} 
WORD [^ \t\n,\.:]+ 
EOL [\n] 
BLANK [ ] 
%% 
{WORD} {w++; c=c+yyleng;} 
{BLANK} {s++;} 
{EOL} {l++;} 
. {c++;} 
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
printf("No of characters=%d\nNo of words=%d\nNo of spaces=%d\n No of lines=%d",c,w,s,l); 
} 
