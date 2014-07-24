json.array!(@roams) do |roam|
  json.extract! roam, :id, :title
  json.url roam_url(roam, format: :json)
end
