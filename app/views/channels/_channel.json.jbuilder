json.extract! channel, :id, :channelName, :created_at, :updated_at
json.url channel_url(channel, format: :json)
