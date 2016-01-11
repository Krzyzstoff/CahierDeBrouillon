class EventsController < ApplicationController
	before_action :authenticate_user!

  def index
    @events = Event.order(date: :asc)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

    def create
      @event = Event.new(event_params)

      if @event.save
        flash[:notice] = "Feesjeuh aangemaakt!"
        redirect_to(:action => 'index')
      else
       render('new')
      end
    end

  def edit
      @event = Event.find(params[:id])
  end

    def update
      @event = Event.find(params[:id])

      if @event.update_attributes(event_params)
        redirect_to(:action => 'index')
      end
    end

  def delete
    @event = Event.find(params[:id])
  end

    def destroy
      Event.find(params[:id]).destroy
      redirect_to(:action => 'index')
    end

  private
    def event_params
      params.require(:event).permit(:title, :date, :price, :cahiercard, :description, :affiche)
    end
end
