json.extract! election, :id, :name, :user_id, :text, :created_at, :updated_at
json.url election_url(election, format: :json)
