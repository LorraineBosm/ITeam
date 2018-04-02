class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def has_role? role
    if current_user.nil? || !current_user.roles.any? {|r| r.name == role}
      redirect_to root_path
    else
      true
    end
  end

  helper_method :has_role?
end
