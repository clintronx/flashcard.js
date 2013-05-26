(function() {

  app.util.TemplateEngine = (function() {

    function TemplateEngine() {}

    TemplateEngine.prototype.cache = {};

    TemplateEngine.prototype.compile = function(id) {
      var compiled;
      if (!id) {
        throw Error("No #template provided for Handlebars to compile");
      }
      if (compiled = this.cache[id]) {
        return compiled;
      }
      this.cache[id] = Handlebars.compile($(id).html());
      return this.cache[id];
    };

    return TemplateEngine;

  })();

}).call(this);
