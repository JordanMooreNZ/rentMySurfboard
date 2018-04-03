json.extract! surfboard, :id, :photo, :beach_id, :name, :description, :price_hash, :address, :user_id, :board_type, :available, :created_at, :updated_at
json.url surfboard_url(surfboard, format: :json)
