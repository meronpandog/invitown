class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when Customer
      users_my_page_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      admin_path
    elsif resource_or_scope == :user
      root_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
