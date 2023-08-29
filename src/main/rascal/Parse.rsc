module Parse

import Syntax;

import ParseTree;


public Syntax::Entities parseEntities(loc file) {
	return parse(#Entities, file);
}

public Syntax::Entities parseEntity(str x) {
	return parse(#Entities, x);
}