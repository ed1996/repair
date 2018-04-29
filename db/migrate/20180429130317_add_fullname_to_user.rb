class AddFullnameToUser < ActiveRecord::Migration
  def change
    add_column :users, :fullnam, :string
  end
end
