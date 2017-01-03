json.extract! item, :id, :url, :titls, :description, :raiting, :created_at, :updated_at
json.url item_url(item, format: :json)