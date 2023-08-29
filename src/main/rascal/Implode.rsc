module Implode

import Syntax;

import AST;

import ParseTree;

public AST::Entities implode(Syntax::Entities pt) {
	return implode(#AST::Entities, pt);
}