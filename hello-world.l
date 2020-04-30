DIGIT [0-9]
ID    [a-zA-Z]([a-zA-Z]|[0-9])*
FLOAT {DIGIT}*"."{DIGIT}+((E|e)("+"|"-")?{DIGIT}*)?

%% 
boolean|break|continue|else|for|float|if|int|return|void|while {
    fprintf(yyout,"%s Keywords\n",yytext); 
}

"true"|"false" {
    fprintf(yyout,"%s BOOLEAN\n",yytext); 
}

{ID} {
    fprintf(yyout,"%s Identifiers\n",yytext); 
}

"+"|"-"|"*"|"/" {
    fprintf(yyout,"%s Arithmetic-Operators\n",yytext); 
}

"<"|"<="|">"|">=" {
    fprintf(yyout,"%s Relational-Operators\n",yytext); 
}

"=="|"!=" {
    fprintf(yyout,"%s Equality-Operators\n",yytext); 
}

"||"|"&&"|"!" {
    fprintf(yyout,"%s Logical-Operators\n",yytext); 
}

"=" {
    fprintf(yyout,"%s Assignment-Operators\n",yytext); 
}

"{"|"}"|"("|")"|"["|"]"|";"|"," {
    fprintf(yyout,"%s Seperators\n",yytext); 
}

{DIGIT}+ {
    fprintf(yyout,"%s INT\n",yytext); 
}

{FLOAT} {
    fprintf(yyout,"%s FLOAT\n",yytext); 
}
""[a-zA-Z]*"" {
    fprintf(yyout,"%s STRING\n",yytext); 
}
(.|" ") 
%% 
  
int yywrap(){} 
int main(){ 
    // read the program
    yyin = fopen("project.vc", "r"); 
  
    // append data to the particular file
    yyout = fopen("result.txt", "w");
    yylex(); 

return 0; 
} 