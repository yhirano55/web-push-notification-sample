class CreateWebPushNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :web_push_notifications do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
