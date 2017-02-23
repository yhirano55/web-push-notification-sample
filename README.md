# WebPushNotificationSample

## Dependencies

- [webpush](https://github.com/zaru/webpush) - webpush, Encryption Utilities for Web Push protocol
- [serviceworker-rails](https://github.com/rossta/serviceworker-rails) - Use Service Worker with the Rails asset pipeline
- [dotenv](https://github.com/bkeepers/dotenv) - A Ruby gem to load environment variables from `.env`.
- [gemoji](https://github.com/github/gemoji) - Emoji images and names.

## Setup

```ruby
# One-time, on the server
vapid_key = Webpush.generate_key

# Save these in your application server settings
vapid_key.public_key  # set env VAPID_PUBLIC_KEY
vapid_key.private_key # set env VAPID_PRIVATE_KEY
```
