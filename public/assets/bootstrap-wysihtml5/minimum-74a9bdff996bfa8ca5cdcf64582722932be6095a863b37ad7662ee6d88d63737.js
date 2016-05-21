this["wysihtml5"] = this["wysihtml5"] || {};
this["wysihtml5"]["tpl"] = this["wysihtml5"]["tpl"] || {};

this["wysihtml5"]["tpl"]["blockquote"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1;

  return "btn-"
    + this.escapeExpression(this.lambda(((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1), depth0));
},"3":function(depth0,helpers,partials,data) {
    return "      <span class=\"fa fa-quote-left\"></span>\n";
},"5":function(depth0,helpers,partials,data) {
    return "      <span class=\"glyphicon glyphicon-quote\"></span>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1;

  return "<li>\n  <a class=\"btn "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + " btn-default\" data-wysihtml5-command=\"formatBlock\" data-wysihtml5-command-value=\"blockquote\" data-wysihtml5-display-format-name=\"false\" tabindex=\"-1\">\n"
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.fa : stack1),{"name":"if","hash":{},"fn":this.program(3, data, 0),"inverse":this.program(5, data, 0),"data":data})) != null ? stack1 : "")
    + "  </a>\n</li>\n";
},"useData":true});

this["wysihtml5"]["tpl"]["color"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1;

  return "btn-"
    + this.escapeExpression(this.lambda(((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1), depth0));
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1, alias1=this.lambda, alias2=this.escapeExpression;

  return "<li class=\"dropdown\">\n  <a class=\"btn btn-default dropdown-toggle "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\" data-toggle=\"dropdown\" tabindex=\"-1\">\n    <span class=\"current-color\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.colours : stack1)) != null ? stack1.black : stack1), depth0))
    + "</span>\n    <b class=\"caret\"></b>\n  </a>\n  <ul class=\"dropdown-menu\">\n    <li><div class=\"wysihtml5-colors\" data-wysihtml5-command-value=\"black\"></div><a class=\"wysihtml5-colors-title\" data-wysihtml5-command=\"foreColor\" data-wysihtml5-command-value=\"black\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.colours : stack1)) != null ? stack1.black : stack1), depth0))
    + "</a></li>\n    <li><div class=\"wysihtml5-colors\" data-wysihtml5-command-value=\"silver\"></div><a class=\"wysihtml5-colors-title\" data-wysihtml5-command=\"foreColor\" data-wysihtml5-command-value=\"silver\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.colours : stack1)) != null ? stack1.silver : stack1), depth0))
    + "</a></li>\n    <li><div class=\"wysihtml5-colors\" data-wysihtml5-command-value=\"gray\"></div><a class=\"wysihtml5-colors-title\" data-wysihtml5-command=\"foreColor\" data-wysihtml5-command-value=\"gray\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.colours : stack1)) != null ? stack1.gray : stack1), depth0))
    + "</a></li>\n    <li><div class=\"wysihtml5-colors\" data-wysihtml5-command-value=\"maroon\"></div><a class=\"wysihtml5-colors-title\" data-wysihtml5-command=\"foreColor\" data-wysihtml5-command-value=\"maroon\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.colours : stack1)) != null ? stack1.maroon : stack1), depth0))
    + "</a></li>\n    <li><div class=\"wysihtml5-colors\" data-wysihtml5-command-value=\"red\"></div><a class=\"wysihtml5-colors-title\" data-wysihtml5-command=\"foreColor\" data-wysihtml5-command-value=\"red\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.colours : stack1)) != null ? stack1.red : stack1), depth0))
    + "</a></li>\n    <li><div class=\"wysihtml5-colors\" data-wysihtml5-command-value=\"purple\"></div><a class=\"wysihtml5-colors-title\" data-wysihtml5-command=\"foreColor\" data-wysihtml5-command-value=\"purple\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.colours : stack1)) != null ? stack1.purple : stack1), depth0))
    + "</a></li>\n    <li><div class=\"wysihtml5-colors\" data-wysihtml5-command-value=\"green\"></div><a class=\"wysihtml5-colors-title\" data-wysihtml5-command=\"foreColor\" data-wysihtml5-command-value=\"green\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.colours : stack1)) != null ? stack1.green : stack1), depth0))
    + "</a></li>\n    <li><div class=\"wysihtml5-colors\" data-wysihtml5-command-value=\"olive\"></div><a class=\"wysihtml5-colors-title\" data-wysihtml5-command=\"foreColor\" data-wysihtml5-command-value=\"olive\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.colours : stack1)) != null ? stack1.olive : stack1), depth0))
    + "</a></li>\n    <li><div class=\"wysihtml5-colors\" data-wysihtml5-command-value=\"navy\"></div><a class=\"wysihtml5-colors-title\" data-wysihtml5-command=\"foreColor\" data-wysihtml5-command-value=\"navy\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.colours : stack1)) != null ? stack1.navy : stack1), depth0))
    + "</a></li>\n    <li><div class=\"wysihtml5-colors\" data-wysihtml5-command-value=\"blue\"></div><a class=\"wysihtml5-colors-title\" data-wysihtml5-command=\"foreColor\" data-wysihtml5-command-value=\"blue\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.colours : stack1)) != null ? stack1.blue : stack1), depth0))
    + "</a></li>\n    <li><div class=\"wysihtml5-colors\" data-wysihtml5-command-value=\"orange\"></div><a class=\"wysihtml5-colors-title\" data-wysihtml5-command=\"foreColor\" data-wysihtml5-command-value=\"orange\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.colours : stack1)) != null ? stack1.orange : stack1), depth0))
    + "</a></li>\n  </ul>\n</li>\n";
},"useData":true});

this["wysihtml5"]["tpl"]["emphasis"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1;

  return "btn-"
    + this.escapeExpression(this.lambda(((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1), depth0));
},"3":function(depth0,helpers,partials,data) {
    var stack1;

  return "    <a class=\"btn "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + " btn-default\" data-wysihtml5-command=\"small\" title=\"CTRL+S\" tabindex=\"-1\">"
    + this.escapeExpression(this.lambda(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.emphasis : stack1)) != null ? stack1.small : stack1), depth0))
    + "</a>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1, alias1=this.lambda, alias2=this.escapeExpression;

  return "<li>\n  <div class=\"btn-group\">\n    <a class=\"btn "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + " btn-default\" data-wysihtml5-command=\"bold\" title=\"CTRL+B\" tabindex=\"-1\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.emphasis : stack1)) != null ? stack1.bold : stack1), depth0))
    + "</a>\n    <a class=\"btn "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + " btn-default\" data-wysihtml5-command=\"italic\" title=\"CTRL+I\" tabindex=\"-1\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.emphasis : stack1)) != null ? stack1.italic : stack1), depth0))
    + "</a>\n    <a class=\"btn "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + " btn-default\" data-wysihtml5-command=\"underline\" title=\"CTRL+U\" tabindex=\"-1\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.emphasis : stack1)) != null ? stack1.underline : stack1), depth0))
    + "</a>\n"
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.emphasis : stack1)) != null ? stack1.small : stack1),{"name":"if","hash":{},"fn":this.program(3, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "  </div>\n</li>\n";
},"useData":true});

this["wysihtml5"]["tpl"]["font-styles"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1;

  return "btn-"
    + this.escapeExpression(this.lambda(((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1), depth0));
},"3":function(depth0,helpers,partials,data) {
    return "      <span class=\"fa fa-font\"></span>\n";
},"5":function(depth0,helpers,partials,data) {
    return "      <span class=\"glyphicon glyphicon-font\"></span>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1, alias1=this.lambda, alias2=this.escapeExpression;

  return "<li class=\"dropdown\">\n  <a class=\"btn btn-default dropdown-toggle "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\" data-toggle=\"dropdown\">\n"
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.fa : stack1),{"name":"if","hash":{},"fn":this.program(3, data, 0),"inverse":this.program(5, data, 0),"data":data})) != null ? stack1 : "")
    + "    <span class=\"current-font\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.font_styles : stack1)) != null ? stack1.normal : stack1), depth0))
    + "</span>\n    <b class=\"caret\"></b>\n  </a>\n  <ul class=\"dropdown-menu\">\n    <li><a data-wysihtml5-command=\"formatBlock\" data-wysihtml5-command-value=\"p\" tabindex=\"-1\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.font_styles : stack1)) != null ? stack1.normal : stack1), depth0))
    + "</a></li>\n    <li><a data-wysihtml5-command=\"formatBlock\" data-wysihtml5-command-value=\"h1\" tabindex=\"-1\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.font_styles : stack1)) != null ? stack1.h1 : stack1), depth0))
    + "</a></li>\n    <li><a data-wysihtml5-command=\"formatBlock\" data-wysihtml5-command-value=\"h2\" tabindex=\"-1\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.font_styles : stack1)) != null ? stack1.h2 : stack1), depth0))
    + "</a></li>\n    <li><a data-wysihtml5-command=\"formatBlock\" data-wysihtml5-command-value=\"h3\" tabindex=\"-1\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.font_styles : stack1)) != null ? stack1.h3 : stack1), depth0))
    + "</a></li>\n    <li><a data-wysihtml5-command=\"formatBlock\" data-wysihtml5-command-value=\"h4\" tabindex=\"-1\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.font_styles : stack1)) != null ? stack1.h4 : stack1), depth0))
    + "</a></li>\n    <li><a data-wysihtml5-command=\"formatBlock\" data-wysihtml5-command-value=\"h5\" tabindex=\"-1\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.font_styles : stack1)) != null ? stack1.h5 : stack1), depth0))
    + "</a></li>\n    <li><a data-wysihtml5-command=\"formatBlock\" data-wysihtml5-command-value=\"h6\" tabindex=\"-1\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.font_styles : stack1)) != null ? stack1.h6 : stack1), depth0))
    + "</a></li>\n  </ul>\n</li>\n";
},"useData":true});

this["wysihtml5"]["tpl"]["html"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1;

  return "btn-"
    + this.escapeExpression(this.lambda(((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1), depth0));
},"3":function(depth0,helpers,partials,data) {
    return "        <span class=\"fa fa-pencil\"></span>\n";
},"5":function(depth0,helpers,partials,data) {
    return "        <span class=\"glyphicon glyphicon-pencil\"></span>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1;

  return "<li>\n  <div class=\"btn-group\">\n    <a class=\"btn "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + " btn-default\" data-wysihtml5-action=\"change_view\" title=\""
    + this.escapeExpression(this.lambda(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.html : stack1)) != null ? stack1.edit : stack1), depth0))
    + "\" tabindex=\"-1\">\n"
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.fa : stack1),{"name":"if","hash":{},"fn":this.program(3, data, 0),"inverse":this.program(5, data, 0),"data":data})) != null ? stack1 : "")
    + "    </a>\n  </div>\n</li>\n";
},"useData":true});

this["wysihtml5"]["tpl"]["image"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    return "modal-sm";
},"3":function(depth0,helpers,partials,data) {
    var stack1;

  return "btn-"
    + this.escapeExpression(this.lambda(((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1), depth0));
},"5":function(depth0,helpers,partials,data) {
    return "      <span class=\"fa fa-file-image-o\"></span>\n";
},"7":function(depth0,helpers,partials,data) {
    return "      <span class=\"glyphicon glyphicon-picture\"></span>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1, alias1=this.lambda, alias2=this.escapeExpression;

  return "<li>\n  <div class=\"bootstrap-wysihtml5-insert-image-modal modal fade\" data-wysihtml5-dialog=\"insertImage\">\n    <div class=\"modal-dialog "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.smallmodals : stack1),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\">\n      <div class=\"modal-content\">\n        <div class=\"modal-header\">\n          <a class=\"close\" data-dismiss=\"modal\">&times;</a>\n          <h3>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.image : stack1)) != null ? stack1.insert : stack1), depth0))
    + "</h3>\n        </div>\n        <div class=\"modal-body\">\n          <div class=\"form-group\">\n            <input value=\"http://\" class=\"bootstrap-wysihtml5-insert-image-url form-control\" data-wysihtml5-dialog-field=\"src\">\n          </div> \n        </div>\n        <div class=\"modal-footer\">\n          <a class=\"btn btn-default\" data-dismiss=\"modal\" data-wysihtml5-dialog-action=\"cancel\" href=\"#\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.image : stack1)) != null ? stack1.cancel : stack1), depth0))
    + "</a>\n          <a class=\"btn btn-primary\" data-dismiss=\"modal\"  data-wysihtml5-dialog-action=\"save\" href=\"#\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.image : stack1)) != null ? stack1.insert : stack1), depth0))
    + "</a>\n        </div>\n      </div>\n    </div>\n  </div>\n  <a class=\"btn "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1),{"name":"if","hash":{},"fn":this.program(3, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + " btn-default\" data-wysihtml5-command=\"insertImage\" title=\""
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.image : stack1)) != null ? stack1.insert : stack1), depth0))
    + "\" tabindex=\"-1\">\n"
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.fa : stack1),{"name":"if","hash":{},"fn":this.program(5, data, 0),"inverse":this.program(7, data, 0),"data":data})) != null ? stack1 : "")
    + "  </a>\n</li>\n";
},"useData":true});

this["wysihtml5"]["tpl"]["link"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    return "modal-sm";
},"3":function(depth0,helpers,partials,data) {
    var stack1;

  return "btn-"
    + this.escapeExpression(this.lambda(((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1), depth0));
},"5":function(depth0,helpers,partials,data) {
    return "      <span class=\"fa fa-share-square-o\"></span>\n";
},"7":function(depth0,helpers,partials,data) {
    return "      <span class=\"glyphicon glyphicon-share\"></span>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1, alias1=this.lambda, alias2=this.escapeExpression;

  return "<li>\n  <div class=\"bootstrap-wysihtml5-insert-link-modal modal fade\" data-wysihtml5-dialog=\"createLink\">\n    <div class=\"modal-dialog "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.smallmodals : stack1),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\">\n      <div class=\"modal-content\">\n        <div class=\"modal-header\">\n          <a class=\"close\" data-dismiss=\"modal\">&times;</a>\n          <h3>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.link : stack1)) != null ? stack1.insert : stack1), depth0))
    + "</h3>\n        </div>\n        <div class=\"modal-body\">\n          <div class=\"form-group\">\n            <input value=\"http://\" class=\"bootstrap-wysihtml5-insert-link-url form-control\" data-wysihtml5-dialog-field=\"href\">\n          </div> \n          <div class=\"checkbox\">\n            <label> \n              <input type=\"checkbox\" class=\"bootstrap-wysihtml5-insert-link-target\" checked>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.link : stack1)) != null ? stack1.target : stack1), depth0))
    + "\n            </label>\n          </div>\n        </div>\n        <div class=\"modal-footer\">\n          <a class=\"btn btn-default\" data-dismiss=\"modal\" data-wysihtml5-dialog-action=\"cancel\" href=\"#\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.link : stack1)) != null ? stack1.cancel : stack1), depth0))
    + "</a>\n          <a href=\"#\" class=\"btn btn-primary\" data-dismiss=\"modal\" data-wysihtml5-dialog-action=\"save\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.link : stack1)) != null ? stack1.insert : stack1), depth0))
    + "</a>\n        </div>\n      </div>\n    </div>\n  </div>\n  <a class=\"btn "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1),{"name":"if","hash":{},"fn":this.program(3, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + " btn-default\" data-wysihtml5-command=\"createLink\" title=\""
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.link : stack1)) != null ? stack1.insert : stack1), depth0))
    + "\" tabindex=\"-1\">\n"
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.fa : stack1),{"name":"if","hash":{},"fn":this.program(5, data, 0),"inverse":this.program(7, data, 0),"data":data})) != null ? stack1 : "")
    + "  </a>\n</li>\n";
},"useData":true});

this["wysihtml5"]["tpl"]["lists"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1;

  return "btn-"
    + this.escapeExpression(this.lambda(((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1), depth0));
},"3":function(depth0,helpers,partials,data) {
    return "      <span class=\"fa fa-list-ul\"></span>\n";
},"5":function(depth0,helpers,partials,data) {
    return "      <span class=\"glyphicon glyphicon-list\"></span>\n";
},"7":function(depth0,helpers,partials,data) {
    return "      <span class=\"fa fa-list-ol\"></span>\n";
},"9":function(depth0,helpers,partials,data) {
    return "      <span class=\"glyphicon glyphicon-th-list\"></span>\n";
},"11":function(depth0,helpers,partials,data) {
    return "      <span class=\"fa fa-outdent\"></span>\n";
},"13":function(depth0,helpers,partials,data) {
    return "      <span class=\"glyphicon glyphicon-indent-right\"></span>\n";
},"15":function(depth0,helpers,partials,data) {
    return "      <span class=\"fa fa-indent\"></span>\n";
},"17":function(depth0,helpers,partials,data) {
    return "      <span class=\"glyphicon glyphicon-indent-left\"></span>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1, alias1=this.lambda, alias2=this.escapeExpression;

  return "<li>\n  <div class=\"btn-group\">\n    <a class=\"btn "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + " btn-default\" data-wysihtml5-command=\"insertUnorderedList\" title=\""
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.lists : stack1)) != null ? stack1.unordered : stack1), depth0))
    + "\" tabindex=\"-1\">\n"
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.fa : stack1),{"name":"if","hash":{},"fn":this.program(3, data, 0),"inverse":this.program(5, data, 0),"data":data})) != null ? stack1 : "")
    + "    </a>\n    <a class=\"btn "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + " btn-default\" data-wysihtml5-command=\"insertOrderedList\" title=\""
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.lists : stack1)) != null ? stack1.ordered : stack1), depth0))
    + "\" tabindex=\"-1\">\n"
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.fa : stack1),{"name":"if","hash":{},"fn":this.program(7, data, 0),"inverse":this.program(9, data, 0),"data":data})) != null ? stack1 : "")
    + "    </a>\n    <a class=\"btn "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + " btn-default\" data-wysihtml5-command=\"Outdent\" title=\""
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.lists : stack1)) != null ? stack1.outdent : stack1), depth0))
    + "\" tabindex=\"-1\">\n"
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.fa : stack1),{"name":"if","hash":{},"fn":this.program(11, data, 0),"inverse":this.program(13, data, 0),"data":data})) != null ? stack1 : "")
    + "    </a>\n    <a class=\"btn "
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.size : stack1),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + " btn-default\" data-wysihtml5-command=\"Indent\" title=\""
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.locale : depth0)) != null ? stack1.lists : stack1)) != null ? stack1.indent : stack1), depth0))
    + "\" tabindex=\"-1\">\n"
    + ((stack1 = helpers['if'].call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.options : depth0)) != null ? stack1.toolbar : stack1)) != null ? stack1.fa : stack1),{"name":"if","hash":{},"fn":this.program(15, data, 0),"inverse":this.program(17, data, 0),"data":data})) != null ? stack1 : "")
    + "    </a>\n  </div>\n</li>\n";
},"useData":true});
/* jshint expr: true */

(function (factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define('bootstrap.wysihtml5', ['jquery', 'wysihtml5', 'bootstrap', 'bootstrap.wysihtml5.templates', 'bootstrap.wysihtml5.commands'], factory);
    } else {
        // Browser globals
        factory(jQuery, wysihtml5);
    }
}(function ($, wysihtml5) {

var bsWysihtml5 = function($, wysihtml5) {
  'use strict';

  var templates = function(key, locale, options) {
    if(wysihtml5.tpl[key]) {
      return wysihtml5.tpl[key]({locale: locale, options: options});
    }
  };

  var Wysihtml5 = function(el, options) {
    this.el = el;
    var toolbarOpts = $.extend(true, {}, defaultOptions, options);
    for(var t in toolbarOpts.customTemplates) {
      wysihtml5.tpl[t] = toolbarOpts.customTemplates[t];
    }
    this.toolbar = this.createToolbar(el, toolbarOpts);
    this.editor =  this.createEditor(toolbarOpts);
  };

  Wysihtml5.prototype = {

    constructor: Wysihtml5,

    createEditor: function(options) {
      options = options || {};

      // Add the toolbar to a clone of the options object so multiple instances
      // of the WYISYWG don't break because 'toolbar' is already defined
      options = $.extend(true, {}, options);
      options.toolbar = this.toolbar[0];

      var editor = new wysihtml5.Editor(this.el[0], options);

      // #30 - body is in IE 10 not created by default, which leads to nullpointer
      // 2014/02/13 - adapted to wysihtml5-0.4, does not work in IE
      if(editor.composer.editableArea.contentDocument) {
        this.addMoreShortcuts(editor, editor.composer.editableArea.contentDocument.body || editor.composer.editableArea.contentDocument, options.shortcuts);
      } else {
        this.addMoreShortcuts(editor, editor.composer.editableArea, options.shortcuts);    
      }
      

      if(options && options.events) {
        for(var eventName in options.events) {
          editor.on(eventName, options.events[eventName]);
        }
      }
      
      editor.on('beforeload', this.syncBootstrapDialogEvents);
      //syncBootstrapDialogEvents();
      return editor;
    },

    //sync wysihtml5 events for dialogs with bootstrap events
    syncBootstrapDialogEvents: function() {
      var editor = this;
      $.map(this.toolbar.commandMapping, function(value, index) {
        return [value];
      }).filter(function(commandObj, idx, arr) {
        return commandObj.dialog;
      }).map(function(commandObj, idx, arr) {
        return commandObj.dialog;
      }).forEach(function(dialog, idx, arr) {
        dialog.on('show', function(event) {
          $(this.container).modal('show');
        });
        dialog.on('hide', function(event) {
          $(this.container).modal('hide');
          editor.composer.focus();
        });
        $(dialog.container).on('shown.bs.modal', function () {
          $(this).find('input, select, textarea').first().focus();
        });
      });
    },

    createToolbar: function(el, options) {
      var self = this;
      var toolbar = $('<ul/>', {
        'class' : 'wysihtml5-toolbar',
        'style': 'display:none'
      });
      var culture = options.locale || defaultOptions.locale || 'en';
      if(!locale.hasOwnProperty(culture)) {
        console.debug('Locale \'' + culture + '\' not found. Available locales are: ' + Object.keys(locale) + '. Falling back to \'en\'.');
        culture = 'en';
      }
      var localeObject = $.extend(true, {}, locale.en, locale[culture]);
      for(var key in options.toolbar) {
        if(options.toolbar[key]) {
          toolbar.append(templates(key, localeObject, options));

          if(key === 'html') {
            this.initHtml(toolbar);
          }

        }
      }

      toolbar.find('a[data-wysihtml5-command="formatBlock"]').click(function(e) {
        var target = e.delegateTarget || e.target || e.srcElement,
            el = $(target),
            showformat = el.data('wysihtml5-display-format-name'),
            formatname = el.data('wysihtml5-format-name') || el.html();
        if(showformat === undefined || showformat === 'true') {
          self.toolbar.find('.current-font').text(formatname);
        }
      });

      toolbar.find('a[data-wysihtml5-command="foreColor"]').click(function(e) {
        var target = e.target || e.srcElement;
        var el = $(target);
        self.toolbar.find('.current-color').text(el.html());
      });

      this.el.before(toolbar);

      return toolbar;
    },

    initHtml: function(toolbar) {
      var changeViewSelector = 'a[data-wysihtml5-action="change_view"]';
      toolbar.find(changeViewSelector).click(function(e) {
        toolbar.find('a.btn').not(changeViewSelector).toggleClass('disabled');
      });
    },

    addMoreShortcuts: function(editor, el, shortcuts) {
      /* some additional shortcuts */
      wysihtml5.dom.observe(el, 'keydown', function(event) {
        var keyCode  = event.keyCode,
            command  = shortcuts[keyCode];
        if ((event.ctrlKey || event.metaKey || event.altKey) && command && wysihtml5.commands[command]) {

          var commandObj = editor.toolbar.commandMapping[command + ':null'];
          if (commandObj && commandObj.dialog && !commandObj.state) {
            commandObj.dialog.show();
          } else {
            wysihtml5.commands[command].exec(editor.composer, command);
          }
          event.preventDefault();
        }
      });
    }
  };

  // these define our public api
  var methods = {
    resetDefaults: function() {
      $.fn.wysihtml5.defaultOptions = $.extend(true, {}, $.fn.wysihtml5.defaultOptionsCache);
    },
    bypassDefaults: function(options) {
      return this.each(function () {
        var $this = $(this);
        $this.data('wysihtml5', new Wysihtml5($this, options));
      });
    },
    shallowExtend: function (options) {
      var settings = $.extend({}, $.fn.wysihtml5.defaultOptions, options || {}, $(this).data());
      var that = this;
      return methods.bypassDefaults.apply(that, [settings]);
    },
    deepExtend: function(options) {
      var settings = $.extend(true, {}, $.fn.wysihtml5.defaultOptions, options || {});
      var that = this;
      return methods.bypassDefaults.apply(that, [settings]);
    },
    init: function(options) {
      var that = this;
      return methods.shallowExtend.apply(that, [options]);
    }
  };

  $.fn.wysihtml5 = function ( method ) {
    if ( methods[method] ) {
      return methods[method].apply( this, Array.prototype.slice.call( arguments, 1 ));
    } else if ( typeof method === 'object' || ! method ) {
      return methods.init.apply( this, arguments );
    } else {
      $.error( 'Method ' +  method + ' does not exist on jQuery.wysihtml5' );
    }    
  };

  $.fn.wysihtml5.Constructor = Wysihtml5;

  var defaultOptions = $.fn.wysihtml5.defaultOptions = {
    toolbar: {
      'font-styles': true,
      'color': false,
      'emphasis': {
        'small': true
      },
      'blockquote': true,
      'lists': true,
      'html': false,
      'link': true,
      'image': true,
      'smallmodals': false
    },
    parserRules: {
      classes: {
        'wysiwyg-color-silver' : 1,
        'wysiwyg-color-gray' : 1,
        'wysiwyg-color-white' : 1,
        'wysiwyg-color-maroon' : 1,
        'wysiwyg-color-red' : 1,
        'wysiwyg-color-purple' : 1,
        'wysiwyg-color-fuchsia' : 1,
        'wysiwyg-color-green' : 1,
        'wysiwyg-color-lime' : 1,
        'wysiwyg-color-olive' : 1,
        'wysiwyg-color-yellow' : 1,
        'wysiwyg-color-navy' : 1,
        'wysiwyg-color-blue' : 1,
        'wysiwyg-color-teal' : 1,
        'wysiwyg-color-aqua' : 1,
        'wysiwyg-color-orange' : 1
      },
      tags: {
        'b':  {},
        'i':  {},
        'strong': {},
        'em': {},
        'p': {},
        'br': {},
        'ol': {},
        'ul': {},
        'li': {},
        'h1': {},
        'h2': {},
        'h3': {},
        'h4': {},
        'h5': {},
        'h6': {},
        'blockquote': {},
        'u': 1,
        'img': {
          'check_attributes': {
            'width': 'numbers',
            'alt': 'alt',
            'src': 'url',
            'height': 'numbers'
          }
        },
        'a':  {
          check_attributes: {
            'href': 'url' // important to avoid XSS
          },
          'set_attributes': {
            'target': '_blank',
            'rel': 'nofollow'
          }
        },
        'span': 1,
        'div': 1,
        'small': 1,
        // to allow save and edit files with code tag hacks
        'code': 1,
        'pre': 1
      }
    },
    locale: 'en',
    shortcuts: {
      '83': 'small'     // S
    }
    
  };

  if (typeof $.fn.wysihtml5.defaultOptionsCache === 'undefined') {
    $.fn.wysihtml5.defaultOptionsCache = $.extend(true, {}, $.fn.wysihtml5.defaultOptions);
  }

  var locale = $.fn.wysihtml5.locale = {};
};
bsWysihtml5($, wysihtml5);
}));
(function(wysihtml5) {
  wysihtml5.commands.small = {
    exec: function(composer, command) {
      return wysihtml5.commands.formatInline.exec(composer, command, "small");
    },

    state: function(composer, command) {
      return wysihtml5.commands.formatInline.state(composer, command, "small");
    }
  };
})(wysihtml5);

/**
 * English translation for bootstrap-wysihtml5
 */

(function (factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define('bootstrap.wysihtml5.en-US', ['jquery', 'bootstrap.wysihtml5'], factory);
    } else {
        // Browser globals
        factory(jQuery);
    }
}(function ($) {
  $.fn.wysihtml5.locale.en = $.fn.wysihtml5.locale['en-US'] = {
    font_styles: {
      normal: 'Normal text',
      h1: 'Heading 1',
      h2: 'Heading 2',
      h3: 'Heading 3',
      h4: 'Heading 4',
      h5: 'Heading 5',
      h6: 'Heading 6'
    },
    emphasis: {
      bold: 'Bold',
      italic: 'Italic',
      underline: 'Underline',
      small: 'Small'
    },
    lists: {
      unordered: 'Unordered list',
      ordered: 'Ordered list',
      outdent: 'Outdent',
      indent: 'Indent'
    },
    link: {
      insert: 'Insert link',
      cancel: 'Cancel',
      target: 'Open link in new window'
    },
    image: {
      insert: 'Insert image',
      cancel: 'Cancel'
    },
    html: {
      edit: 'Edit HTML'
    },
    colours: {
      black: 'Black',
      silver: 'Silver',
      gray: 'Grey',
      maroon: 'Maroon',
      red: 'Red',
      purple: 'Purple',
      green: 'Green',
      olive: 'Olive',
      navy: 'Navy',
      blue: 'Blue',
      orange: 'Orange'
    }
  };
}));




