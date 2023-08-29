module Test

import Syntax;
extend Checker;
extend analysis::typepal::TestFramework;
import ParseTree;

TModel myentitylangTModelFromTree(Tree pt){
    return collectAndSolve(pt);
}

TModel myentitylangTModelFromStr(str text){
    pt = parse(#start[Entities], text).top;
    return myentitylangTModelFromTree(pt);
}

TModel myentitylangTModelFromLoc(){
    loc src = |project://myentitylang/input/test.tap|;
    pt = parse(#start[Entities], src);
    return myentitylangTModelFromTree(pt);
}

bool myentitylangTests() {
     return runTests([|project://myentitylang/src/main/rascal/tests.ttl|], 
                     #Entities, myentitylangTModelFromTree);
}