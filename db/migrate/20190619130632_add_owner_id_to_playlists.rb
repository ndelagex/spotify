class AddOwnerIdToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :ownerId, :string
  end
end
