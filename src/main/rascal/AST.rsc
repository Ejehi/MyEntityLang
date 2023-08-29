module AST

extend Syntax;

data Entities = entities(str module_name, list[Entity] entity_list);

data Entity = entity(str entity_name, list[Attribute] attribute_list, list[EntityIdent] entity_identlist);

data EntityIdent = entityIdent(str attribute_name);

data Attribute = simpleType(str attribute_name, Type tp)
                | associationType(str attribute_name, Type tp)
                ;

data Type = name(str id)
            | string()
            ;