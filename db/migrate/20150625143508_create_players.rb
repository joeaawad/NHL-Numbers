class CreatePlayers < ActiveRecord::Migration
  def change
  	create_table :players do |t|
  		t.references :team
  		t.integer :number, :limit => 2
  		t.string :position, :limit => 20
  		t.string :name, :limit => 100

  		t.timestamps
  	end
  end
end
