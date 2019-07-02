class DropColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_columns :users, :encrypted_password, :salt
  end
end
