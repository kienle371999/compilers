import java.util.*;
import java.io.FileWriter;
import java.io.IOException;

%%
%class search
%standalone
%line
%column
DIGIT = [0-9]
ID    = [a-zA-Z]([a-zA-Z]|[0-9])*
FLOAT = {DIGIT}*"."{DIGIT}+((E|e)("+"|"-")?{DIGIT}*)?
%{
    List<String> numbers = new ArrayList();
%}

%eof{
    try {
        FileWriter writer = new FileWriter("result.txt", true);
        for (int i = 0; i < numbers.size(); i++) {
            writer.write(numbers.get(i));
            writer.write("\n");
        }
        writer.close();
    }
    catch(IOException ex) {
        ex.printStackTrace();
    }
    
%eof}

%%

boolean|break|continue|else|for|float|if|int|return|void|while {
    numbers.add(String.format("%s Keywords",yytext()));
}

"true"|"false" {
    numbers.add(String.format("%s BOOLEAN",yytext()));
}

(\"{ID}\") {
    numbers.add(String.format("%s STRING",yytext()));
}

{ID} {
    numbers.add(String.format("%s Identifiers",yytext()));
}

"+"|"-"|"*"|"/" {
    numbers.add(String.format("%s Arithmetic-Operators",yytext()));
}

"<"|"<="|">"|">=" {
    numbers.add(String.format("%s Relational-Operators",yytext()));
}

"=="|"!=" {
    numbers.add(String.format("%s Equality-Operators",yytext()));
}

"||"|"&&"|"!" {
    numbers.add(String.format("%s Logical-Operators",yytext()));
}

"=" {
    numbers.add(String.format("%s Assignment-Operators",yytext()));
}

"{"|"}"|"("|")"|"["|"]"|";"|"," {
    numbers.add(String.format("%s Seperators",yytext()));
}

{DIGIT}+ {
    numbers.add(String.format("%s INT",yytext()));
}

{FLOAT} {
    numbers.add(String.format("%s FLOAT",yytext()));
}

(.|" ") {
    /* Do Nothing */
}


