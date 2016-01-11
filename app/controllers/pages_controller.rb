class PagesController < ApplicationController
  def index
  		@events = Event.order(date: :asc).select{|s| s.date >= Date.current}
  		@datum = params[:date] ? Date.parse(params[:date]) : Date.today
 	end

 	def agenda
 		@year =  params[:year] ? params[:year] : Date.today.year
 		@events = Event.by_year(@year.to_i).order(date: :asc)
 		@huidig = Event.order(date: :asc).select{|s| s.date >= Date.current}.first
 		@datum = params[:date] ? Date.parse(params[:date]) : Date.today
 	end

 		def from_agenda
 			@event = Event.find(params[:id]) 
 			
 			respond_to do |format|
        format.js
    	end
 		end

 	def contact
 		@datum = params[:date] ? Date.parse(params[:date]) : Date.today
 	end

end
