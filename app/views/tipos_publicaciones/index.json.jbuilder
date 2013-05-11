json.array!(@tipos_publicaciones) do |tipo_publicacion|
  json.extract! tipo_publicacion, :nombre
  json.url tipo_publicacion_url(tipo_publicacion, format: :json)
end