class League < ActiveRecord::Base
  
  has_many :teams
  has_many :players, :through => :teams

  validates :name, :abbreviation, {:presence => true, :uniqueness => true}
  validates :abbreviation, :length => {minimum: 2, maximum: 10}

end
