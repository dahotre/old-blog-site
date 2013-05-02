class PagesController < ApplicationController
  def home
    @title = "Home"
    @cell = "home"
    @wallpaper = WallpaperFactory.instance.get_wallpaper
    if @wallpaper.nil? then
      @wallpaper = Wallpaper.new(:url=> "cottonwood.jpg", :height=>450, :width=>850)
    end
    @topProgrammings = NodeFactory.instance.top_programmings(3)
    @topRamblings = NodeFactory.instance.top_ramblings(3)
    @topProjects = Array.new
  end

  def contact
    @title = "Contact"
    @cell = "contact"
  end

end
