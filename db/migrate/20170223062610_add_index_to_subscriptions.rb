class AddIndexToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_index :subscriptions, :endpoint
  end
end
