class Album < ActiveRecord::Base
	has_many :photos, dependent: :destroy
	accepts_nested_attributes_for :photos, :allow_destroy => true

	def self.by_year(year)
  	dt = Date.new(year)
  	boy = dt.beginning_of_year
  	eoy = dt.end_of_year
  	where("date >= ? and date <= ?", boy, eoy)
	end
end
