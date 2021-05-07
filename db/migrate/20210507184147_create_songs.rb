class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :song_style_id, null: false
      t.integer :user_id, null: false
      t.string :file, null: false
      t.string :tittle, null: false
      t.text :detail
      t.string :image_id

      t.timestamps
    end
  end
end
