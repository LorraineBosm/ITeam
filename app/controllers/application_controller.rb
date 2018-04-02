class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def has_role? role
    if current_user.nil? || !current_user.roles.any? {|r| r.name == role}
      false
    else
      true
    end
  end

  def has_access? role
    if current_user.nil? || !current_user.roles.any? {|r| r.name == role}
      redirect_to root_path
    end
  end

  helper_method :has_role?
  helper_method :has_access?
end
