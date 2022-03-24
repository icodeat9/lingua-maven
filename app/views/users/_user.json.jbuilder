json.extract! user, :id, :given_name, :family_name, :email, :preferred_timezone, :created_at, :updated_at
json.url user_url(user, format: :json)
