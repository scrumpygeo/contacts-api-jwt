class RemoveConfirmedAtFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :confirmed_at, :datetime
  end
end
