class DealsController < ApplicationController
  respond_to :json, :html
  def index
    @title = "Chrome extension for Deals on Overstock.com"
    # cookies.permanent[:extn] = Date.today.strftime("%Y%m%d")
    deal = Deal.lastDeal()
    
    #First time
    #If last update was > 24hrs ago
    #If last update was before midnight but within 24 hrs
    logger.info deal.created_at
    logger.info deal.created_at.day
    logger.info Date.today
    logger.info Date.today.day
    if (params[:force] == '1' || deal.nil? || deal.created_at.day<DateTime.now.in_time_zone("Mountain Time (US & Canada)").day )
      deal = Deal.scrape
    end
    respond_with(deal.attributes)
  end
end
