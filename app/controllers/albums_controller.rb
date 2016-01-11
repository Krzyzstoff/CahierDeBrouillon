class AlbumsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]



 def index
    @year =  params[:year] ? params[:year] : Date.today.year
    @albums = Album.by_year(@year.to_i).order(date: :asc)
    @datum = params[:date] ? Date.parse(params[:date]) : Date.today  
  end

  def show
    @album = Album.find(params[:id])
    redirect_to(:controller => 'photos', :action => 'index', :album_id => @album.id)
    @datum = params[:date] ? Date.parse(params[:date]) : Date.today
    end

  def new
    @album = Album.new
  end

  def create
      @album = Album.new(album_params)

      if @album.save
        flash[:notice] = "Album aangemaakt!"
          redirect_to(:action => 'index')
      else
          render('new')
      end
    end

  def edit
      @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(album_params)
      redirect_to(:action => 'index')
    end
  end

  def delete
    @album = Album.find(params[:id])
  end

  def destroy
    Album.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  private
    def album_params
      params.require(:album).permit(:title, :date, :description)
    end
end
