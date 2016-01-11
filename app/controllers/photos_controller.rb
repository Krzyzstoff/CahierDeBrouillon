class PhotosController < ApplicationController

  def index
    @album = Album.find(params[:album_id])
    @photos = @album.photos.all
    @photo = @album.photos.new
    @datum = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def show
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
  end

  def new
    @album = Album.find(params[:album_id])
    @photo = @album.photos.new
  end

	  def create
	  	@album = Album.find(params[:album_id])
    	params[:photo]['photo'].each do |a|
        @photo = @album.photos.create!(:photo => a)
      end
    		if @photo.save
      		redirect_to(:controller => 'photos', :action => 'index', :album_id => @album.id)
    		end
	  end

  def edit
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
  end

  def update
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(photo_params)
      redirect_to('/index')
    end
  end

  def delete
    @photo = Photo.find(params[:id])
  end

  def destroy
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to(:controller => 'photos', :action => 'index', :album_id => @album.id)
  end

  private
    def photo_params
      params.require(:photo).permit(:photo, :album_id)
    end
end
