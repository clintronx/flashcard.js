class app.util.TemplateEngine

  cache: {}

  compile: (id) ->
    return "" unless id
    return compiled if compiled = @cache[id]

    compiled = @_compile id
    @cache[id] = compiled

    compiled

  _compile: (id) ->
    Handlebars.compile $(id).html()