class AddFeaturesToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :is_vocal, :int, default: 1
    add_column :playlists, :is_dancing, :int, default: 1
    add_column :playlists, :is_day, :int, default: 1
    add_column :playlists, :is_robot, :int, default: 1
    add_column :playlists, :is_summer, :int, default: 1
    add_column :playlists, :is_urban, :int, default: 1
  end
end
