class AddAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :kusers, :admin, :boolean
  end
end
