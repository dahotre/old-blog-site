class ArtistsController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  @artists = Array.new
  @artist = nil

  def index
    @artists = Artist.order("updated_at DESC")
    @title = "Featured Artists "
  end

  def show
    @artist = Artist.find(params[:id])
    @title = "#{@artist.name} | " + (@artist.song.nil? ? "" : @artist.song.name )
  end

  def new
    @artist = Artist.new
    @artist.build_song
  end

  def create
    @artist = Artist.new(params[:artist])
    if @artist.save
      redirect_to :action => "show", :id => @artist
    else
      render :new
    end
  end
  
  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      redirect_to :action => "show", :id => @artist
    else
      render :new
    end
  end

end
