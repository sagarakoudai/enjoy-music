class CreateSongStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :song_styles do |t|
      t.string :style, null: false
      t.string :image_id

      t.timestamps
    end
  end
end
