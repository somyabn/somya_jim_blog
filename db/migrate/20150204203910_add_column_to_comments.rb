class AddColumnToComments < ActiveRecord::Migration
  def change
    add_column :comments, :userid, :integer
  end
end
