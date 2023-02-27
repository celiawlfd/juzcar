class AddUsernameAndAttributeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, null: false, default: ""
    add_column :users, :characteristic, :string, null: false, default: ""
  end
end
