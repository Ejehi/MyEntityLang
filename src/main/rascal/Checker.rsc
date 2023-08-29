module Checker

import Syntax;

extend analysis::typepal::TypePal;

data AType   
    = stringType()
    | associationType(str name)                                   
    ;

str prettyAType(stringType()) = "string";
str prettyAType(associationType(name)) = "<name>";

data IdRole
    = variableId()
    ;


// Collect MyEntityLang
void collect(current: (Entities) `module <Id module_name> <Entity+ entity_list>`, Collector c) {
    c.define("<module_name>", variableId(), module_name, defType(stringType()));
    for(entity <- entity_list) collect(entity, c);
}

// Collect Entity
void collect(current: (Entity) `entity <Id entity_name> <Attribute+ attribute_list> <EntityIdent? ident_list> end`, Collector c) {
    c.enterScope(current);
        c.define("<entity_name>", variableId(), entity_name, defType(stringType()));
        for(attribute <- attribute_list) collect(attribute, c);
        for(ident <- ident_list) collect(ident, c);
    c.leaveScope(current);

}

// Collect EntityIdent
void collect(current: (EntityIdent) `repr <Id attribute_name>`, Collector c) {
    c.use(attribute_name, {variableId()});
}

// Collect Attribute
void collect(current: (Attribute) `<Id attribute_name> : <Type tp>`, Collector c) {
    c.define("<attribute_name>", variableId(), attribute_name, defType(tp));
    collect(tp, c);
}

void collect(current: (Attribute) `<Id attribute_name> -\> <Type tp>`, Collector c) {
    c.define("<attribute_name>", variableId(), attribute_name, defType(associationType("<tp>")));
    collect(tp, c);
}

// Collect Type
void collect(current: (Type) `String`, Collector c) {
    c.fact(current, stringType());
}

void collect(current: (Type) `<Id entity_name>`, Collector c) {
    c.fact(current, associationType("<entity_name>"));
}