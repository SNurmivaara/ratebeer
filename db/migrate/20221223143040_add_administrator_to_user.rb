class AddAdministratorToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :administrator, :boolean
  end
end
