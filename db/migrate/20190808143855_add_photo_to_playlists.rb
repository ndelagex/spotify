class AddPhotoToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :photo, :string
  end
end
