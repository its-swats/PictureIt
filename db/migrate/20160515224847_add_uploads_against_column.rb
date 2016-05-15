class AddUploadsAgainstColumn < ActiveRecord::Migration
  def change
  	add_column :photos, :uploads_against, :integer, default: 0
  end
end
