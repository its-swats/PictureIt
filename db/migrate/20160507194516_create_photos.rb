class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.string :caption
    	t.string :filename
    	t.binary :data
    	t.string :mime_type
      t.timestamps null: false
    end
  end
end
