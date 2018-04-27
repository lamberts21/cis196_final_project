json.extract! recipe_comment, :id, :field, :recipe_id, :user_id, :created_at, :updated_at
json.url recipe_comment_url(recipe_comment, format: :json)
