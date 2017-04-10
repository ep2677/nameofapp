json.extract! product, :id, :name, :description, :text, :image_url, :string, :created_at, :updated_at
json.url product_url(product, format: :json)
