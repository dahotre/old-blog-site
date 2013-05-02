require 'singleton'

class WallpaperFactory
  include Singleton
  @@wallpaper = nil
  @@wallpapers = nil
  
  def get_wallpaper
    @@wallpaper  ||= Wallpaper.last(:conditions => ["fromDate <= :todayDate AND toDate >= :todayDate", { :todayDate => Date.today}])
    @@wallpaper ||= Wallpaper.last
    return @@wallpaper
  end
  
  def get_wallpapers
    @@wallpapers ||= Wallpaper.all.sort{|a, b|b.updated_at <=> a.updated_at}
    return @@wallpapers
  end
  
  def reset_wallpapers
    @@wallpapers = nil
    @@wallpaper = nil
  end
  
end