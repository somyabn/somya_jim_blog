class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text_comment
      t.integer :postid

      t.timestamps null: false
    end
  end
end
