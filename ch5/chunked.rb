def call(env)
  status, headers, body = @app.call(env)
  headers = HeaderHash.new(headers)

  if env['HTTP_VERSION'] == 'HTTP/1.0' ||
    STATUS_WITH_NO_ENTITY_BODY.include?(status) ||
    headers['Content-Length'] ||
    headers['Transfer-Encoding']
    [status, headers, body]
  else
    dup.chunk(status, headers, body)
  end
end