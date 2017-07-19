json.extract! user, :id, :firstname, :lastname, :emailid, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
