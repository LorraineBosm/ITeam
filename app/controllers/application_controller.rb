class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def is_acceptor?
    redirect_to root_path if current_user.nil? || !current_user.acceptor?
  end
end
