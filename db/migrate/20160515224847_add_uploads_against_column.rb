class AddUploadsAgainstColumn < ActiveRecord::Migration
  def change
  	add_column :photos, :uploads_against, :integer
  end
end
