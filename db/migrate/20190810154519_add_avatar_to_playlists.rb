class AddAvatarToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :avatar, :string
  end
end
