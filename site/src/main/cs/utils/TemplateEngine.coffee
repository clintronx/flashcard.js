class app.util.TemplateEngine

  cache: {}

  compile: (id) ->
    throw Error "No #template provided for Handlebars to compile" unless id
    return compiled if compiled = @cache[id]
    
    @cache[id] = Handlebars.compile $(id).html()
    @cache[id]