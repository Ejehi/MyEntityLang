module Load

import AST;
import Parse;
import Implode;


public Entities load() {
	return implode(parseEntities(programPath()));
}

loc programPath() {
	return |project://myentitylang/input/test.tap|;
}
