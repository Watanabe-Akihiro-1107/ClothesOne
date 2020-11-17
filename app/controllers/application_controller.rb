class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
protected
	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])#deviseのストロングパラメータ
    	devise_parameter_sanitizer.permit(:sign_in,keys:[:email,:nickname])
  	end

  		#signin後のリダイレクト先
	def after_sign_in_path_for(resource)
	  	case resource
	  		when Admin
	    		admin_top_path
	  		when User
	     		items_path
	  	end
	end

	#signout後のリダイレクト先
	def after_sign_out_path_for(resource)
	  	case resource
	  		when :admin
	    		new_admin_session_path
	  		when :user
	    		root_path
	  	end
	end
end
