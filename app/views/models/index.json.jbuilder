json.models @models do |model|
  json.name model.name
  json.model_types model.model_types do |model_type|
    json.name model_type.name
  end
end
