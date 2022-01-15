json.extract! event, :id, :name, :date, :place, :time, :surface, :organizer, :info, :created_at, :updated_at
json.url event_url(event, format: :json)
