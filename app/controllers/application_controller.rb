class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def has_role? role
    redirect_to root_path if current_user.nil? || !current_user.roles.any? {|r| r.name == role}
  end
end
