json.extract! question, :id, :name, :email, :message, :responded, :questionTopic, :created_at, :updated_at
json.url question_url(question, format: :json)
