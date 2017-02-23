class WebPushNotification < ApplicationRecord
  with_options presence: true, length: { maximum: 32 } do
    validates :title
    validates :body
  end

  after_create :publish

  def message
    { title: emojify(title), body: emojify(body) }.to_json
  end

  protected

  def publish
    Subscription.all.each do |subscription|
      begin
        Webpush.payload_send(
          message: message,
          endpoint: subscription.endpoint,
          p256dh: subscription.p256dh,
          auth: subscription.auth,
          vapid: {
            subject: "mailto:sender@example.com",
            public_key: ENV['VAPID_PUBLIC_KEY'],
            private_key: ENV['VAPID_PRIVATE_KEY']
          }
        )
      rescue => e
        logger.info e.message
      end
    end
  end

  private

  def emojify(text)
    text.gsub(/:([\w+-]+):/) do |match|
      if emoji = Emoji.find_by_alias($1)
        emoji.raw
      else
        match
      end
    end
  end
end
