require 'sinatra'
require 'json'

# Permitir CORS
before do
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'Content-Type, Authorization'
end

# Tratar requisições OPTIONS (pré-flight)
options '*' do
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'Content-Type, Authorization'
  200
end

# Rota GET básica com CORS e status 200
get '/api' do
  content_type :json
  status 200
  { message: 'Olá! Este é um endpoint GET.' }.to_json
end

# Rota POST básica com CORS e status 200
post '/api' do
  content_type :json
  request_body = JSON.parse(request.body.read)

  status 200
  { message: "Você enviou: #{request_body['data']}" }.to_json
end
