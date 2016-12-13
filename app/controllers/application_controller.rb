class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def root_redirect_to
    redirect_to deliveries_new_path(destination: :market)
  end
end
