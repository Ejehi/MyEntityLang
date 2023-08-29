module Lex

extend lang::std::Layout;

lexical Id = ([a-z A-Z 0-9] !<< [a-z A-Z] [a-z A-Z 0-9]* !>> [a-z A-Z 0-9]) \ Keyword;

lexical IntegerLiteral = [0-9] !<< ( "-"? [0-9]+ ) !>> [0-9];

lexical BooleanLiteral = "true" 
                        | "false";

lexical StringLiteral = [\"] String_Content* [\"];
lexical String_Content  = ![\\ \" \n] 
                        | "\\" [\\ \"]
                        ;

keyword Keyword = "repr"
                | "end"
                | "module"
                | "String"
                | "Integer"
                | "Boolean";