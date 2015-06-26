class CreateLeagues < ActiveRecord::Migration
  def change
  	create_table :leagues do |t|
  		t.string :name, :limit => 100
  		t.string :abbreviation, :limit => 10
  		t.text :possible_numbers

  		t.timestamps
  	end
  end
end
