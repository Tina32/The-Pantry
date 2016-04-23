json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :completed
  json.url recipe_url(recipe, format: :json)
end
