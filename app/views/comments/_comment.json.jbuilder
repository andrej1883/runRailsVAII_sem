json.extract! comment, :id, :commentText, :created_at, :updated_at
json.url comment_url(comment, format: :json)
