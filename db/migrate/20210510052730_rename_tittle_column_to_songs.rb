class RenameTittleColumnToSongs < ActiveRecord::Migration[5.2]
  def change
    rename_column :songs, :tittle, :title
  end
end