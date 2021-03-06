class SessionsController < ApplicationController

  layout "login"

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:username].downcase)

    respond_to do |format|
	    if @user && @user.authenticate(params[:session][:password])
	      # Log the user in and redirect to the user's show page.
        @user.registration_id = params[:session][:registrationId]
        @user.save
	      log_in @user
	      format.html { redirect_to workflows_path }
        format.json {render :json => @user, :except=>  [:password]  }
	    else
	      format.html { redirect_to root_path, :flash => { :notice => "Invalid email/password combination" }  }
          format.json { head 401 }
	    end
	end
  end

  def destroy
  end

  def show

  end

end
