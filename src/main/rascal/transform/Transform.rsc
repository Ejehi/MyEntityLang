module transform::Transform

import ParseTree;

import Syntax;
import Implode;

import Prelude;

import transform::Entities2Django;


public void generateDjango() {
	loc src = |project://myentitylang/input/test.tap|;
	pt = parse(#Entities, src);
	model = entities2django(implode(pt));
	writeFile(|project://myentitylang/output/models.py|, model);
}