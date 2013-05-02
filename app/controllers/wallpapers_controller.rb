class WallpapersController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  @wallpapers = Array.new
  @wallpaper = nil

  def index
    @wallpapers = WallpaperFactory.instance.get_wallpapers.shuffle
    @title = "Gallery"
    @cell = "wallpapers"
    @artists = Artist.find_all_by_art("music")
  end

  def show
    @wallpapers = WallpaperFactory.instance.get_wallpapers
    @wallpaper = Wallpaper.find(params[:id])
    @prev = nil
    @next = nil
    @wallpapers.each_with_index{|w,i|
      if w.id==@wallpaper.id then
        @prev = @wallpapers[(i-1)%@wallpapers.size]
        puts "prev:"
        puts @prev
        @next = @wallpapers[(i+1)%@wallpapers.size]
        puts "next:"
        puts @next
      end
    }
    @title = @wallpaper.url.split('.').first.capitalize.sub("_", " ") + " | Gallery"
    @cell = "wallpapers"
  end

  def new
    @wallpaper = Wallpaper.new
  end

  def create
    @wallpaper = Wallpaper.new(params[:wallpaper])
    if @wallpaper.save
      #redirect_to :action => "show", :id => @wallpaper
      WallpaperFactory.instance.reset_wallpapers
      redirect_to home_path
    else
      render :new
    end
  end

  def edit
    @wallpaper = Wallpaper.find(params[:id])
  end

  def update
    @wallpaper = Wallpaper.find(params[:id])
    if @wallpaper.update_attributes(params[:wallpaper])
      #redirect_to :action => "show", :id => @wallpaper
      WallpaperFactory.instance.reset_wallpapers
      redirect_to home_path
    else
      render :new
    end
  end

end
