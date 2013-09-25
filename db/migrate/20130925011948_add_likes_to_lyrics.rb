class AddLikesToLyrics < ActiveRecord::Migration
  def change
  	add_column :lyrics, :likes, :float
  end
end
