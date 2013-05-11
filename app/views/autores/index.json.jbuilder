json.array!(@autores) do |autor|
  json.extract! autor, :nombre
  json.url autor_url(autor, format: :json)
end