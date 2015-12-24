class AddUserEmailToLists < ActiveRecord::Migration
  def change
    add_column :lists, :user_email, :string
  end
end
