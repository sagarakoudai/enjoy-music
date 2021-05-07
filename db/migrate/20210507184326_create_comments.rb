class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :song_id, null: false
      t.string :body


      t.timestamps
    end
  end
end
