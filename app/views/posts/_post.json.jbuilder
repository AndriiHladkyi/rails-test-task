json.extract! post, :id, :title, :text, :category_id, :shared_url, :created_at, :updated_at
json.url post_url(post, format: :json)
