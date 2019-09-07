class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :admin?, :staff?


  def admin?
    current_user.position == "admin"
  end

  def staff?
    current_user.position == "staff"
  end
end
