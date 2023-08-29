module compile::Entities2Django

import AST;
import String;


// public rel[str,str] entities2django(Entities es) {
// 	return { <e.entity_name, entity2django(e)> | e <- es.entity_list };
// }

public str entities2django(Entities es) {
	return "from django.db import models
            '<for (e <- es.entity_list) {>
            '<entity2django(e)>
            '<}>
            ";
}

public str entity2django(Entity e) {
	return "class <e.entity_name>(models.Model):
            '<for (attr <- e.attribute_list) {>
            '	<attribute2django(attr)>
            '<}>
			'<for (id <- e.entity_identlist) {>
            '<idents2django(e, id)>
            '<}>
            ";
}

public str idents2django(Entity e, EntityIdent id) {
	return "	def __unicode__(self):
			'		return \"<e.entity_name>: {0}\".format(self.<id.attribute_name>)
			";
}

public str attribute2django(Attribute attr) {
	switch (attr) {
		case simpleType(attr_name, tp): return "<attr_name> = <type2django(tp)>";
		case associationType(attr_name, tp): return "<attr_name> = <type2django(tp)>";
		default: return "";
	}
}

public str type2django(Type tp) {
	switch (tp) {
		case name(entity_name): return "models.ForeignKey(<entity_name>)";
        case string(): return "models.CharField(max_length=256)";
		default: return "";
	}
}