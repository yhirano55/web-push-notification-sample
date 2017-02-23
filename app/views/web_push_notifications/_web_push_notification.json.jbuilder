json.extract! web_push_notification, :id, :title, :body, :created_at, :updated_at
json.url web_push_notification_url(web_push_notification, format: :json)
