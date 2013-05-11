json.array!(@publicaciones) do |publicacion|
  json.extract! publicacion, :titulo, :texto, :url_original, :autor_id, :tipo_id
  json.url publicacion_url(publicacion, format: :json)
end