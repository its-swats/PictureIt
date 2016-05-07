class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.string :ip
    	t.boolean :vote
      t.timestamps null: false
    end
  end
end
