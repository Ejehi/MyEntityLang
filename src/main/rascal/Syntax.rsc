module Syntax

extend Lex;

start syntax Entities = entities: "module" Id Entity+;

syntax Entity = entity: "entity" Id Attribute+ EntityIdent? "end";

syntax EntityIdent = entityIdent: "repr" Id;

syntax Attribute = simpleType: Id ":" Type
                | associationType: Id "-\>" Type
                ;

syntax Type = name: Id
            | string: "String"
            ;