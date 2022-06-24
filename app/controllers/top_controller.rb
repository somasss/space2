class TopController < ApplicationController
  def index
    redirect_to users_show_path if user_signed_in?
  end

end
