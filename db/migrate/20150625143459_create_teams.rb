class CreateTeams < ActiveRecord::Migration
  def change
  	create_table :teams do |t|
  		t.references :league
  		t.string :location, :limit => 30
  		t.string :nickname, :limit => 40
  		t.string :abbreviation, :limit => 3

  		t.timestamps
  	end
  end
end
