class AddDetailsToMaps < ActiveRecord::Migration[6.1]
  def change
    add_column :maps, :lat, :float
    add_column :maps, :lng, :float
  end
end
