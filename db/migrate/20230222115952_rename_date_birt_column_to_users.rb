class RenameDateBirtColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :date_birt, :date_birth
  end
end
