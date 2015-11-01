json.array!(@actors) do |actor|
  json.extract! actor, :id, :name, :dob
  json.url actor_url(actor, format: :json)
end
