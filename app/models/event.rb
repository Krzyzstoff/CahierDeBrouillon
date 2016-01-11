class Event < ActiveRecord::Base
	mount_uploader :affiche, AfficheUploader
	
	def self.by_year(year)
  	dt = Date.new(year)
  	boy = dt.beginning_of_year
  	eoy = dt.end_of_year
  	where("date >= ? and date <= ?", boy, eoy)
	end
end
