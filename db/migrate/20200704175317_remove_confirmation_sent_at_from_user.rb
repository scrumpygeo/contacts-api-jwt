class RemoveConfirmationSentAtFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :confirmation_sent_at, :datetime
  end
end
