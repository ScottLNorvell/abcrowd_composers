class AddTitleToLyric < ActiveRecord::Migration
  def change
  	add_column :lyrics, :title, :string
  end
end
