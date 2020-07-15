class AddConfirmableToUsers < ActiveRecord::Migration[6.0]
    def up 
      add_column :users, :confirmation_token, :string
      add_column :users, :confirmed_at, :datetime
      add_column :users, :confirmation_sent_at, :datetime

      add_index :users, :confirmation_token, unique: true

      # execute("UPDATE users SET confirmed_at = NOW()")
      User.update_all confirmed_at: DateTime.now

    end

    def down 
      remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
    # remove_columns :users, :unconfirmed_email # Only if using reconfirmable    
    end
end
