class RemoveUnconfirmedEmailFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :unconfirmed_email, :string
  end
end
