class UsersController < ApplicationController
  respond_to :html, :json, :xml
  @title = "User data"  
  def show
    logger.info "---"
    logger.info params[:id]
    logger.info "---"
    id = params[:id]
    if params[:id].blank? then
      id = cookies[:userid]
    end
    if !id.blank? then
      @user = User.find(id)
      respond_with(@user.transactions)
    end
  end
end
