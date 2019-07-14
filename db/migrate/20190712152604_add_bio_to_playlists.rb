class AddBioToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :bio, :text
  end
end
