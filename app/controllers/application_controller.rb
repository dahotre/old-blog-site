class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :admin?, :authorize
  @image = "http://www.dahotre.com/images/" + WallpaperFactory.instance.get_wallpaper.url
  def admin?
    session[:password] == Admin.find_by_atype("admin").password
  rescue => e
    logger.error e.message
    logger.error e.backtrace
    false
  end
  
  def authorize
    unless admin?
      flash[:error] = "unauthorized access"
      redirect_to home_path
      false
    end
  end
  
  def setCookies
    logger.info "in cookies.........."
    if cookies[:userid].nil? then
      logger.info "user id is nil...." + request.remote_ip
  		user_id = nil
  		logger.info "Is IP registered in transactions table :"
  		logger.info Transaction.find_by_remote_ip(request.remote_ip)
  		logger.info Transaction.find_by_remote_ip(request.remote_ip).nil?.to_s
  		logger.info "-----------"
  		if Transaction.find_by_remote_ip(request.remote_ip).nil?
  			user = User.new
  			user.save
  			logger.info "User id : " + user.id.to_s
  			user_id = user.id
  		else
  			logger.info "Not blank................"
  			user_id = Transaction.find_by_remote_ip(request.remote_ip).user_id
  			logger.info "User id found is :" + user_id.to_s
  		end
  		logger.info "Setting cookie...."
  		cookies.permanent[:userid] = user_id
  		logger.info "set cookie: " + cookies[:userid].to_s
  	end
  	logger.info "out of cookies.........."
	end
	
	def isBot?(agent)
	  agent =~ /\b(Baidu|Gigabot|Googlebot|libwww-perl|lwp-trivial|msnbot|SiteUptime|Slurp|WordPress|ZIBB|ZyBorg|Mediapartners-Google|Twitterbot|yacybot|Disqus|LinkedInBot)\b/i
	  !agent.nil?
  end
	
end
