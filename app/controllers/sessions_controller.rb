class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    respond_to do |format|
	    if @user && @user.authenticate(params[:session][:password])
	      # Log the user in and redirect to the user's show page.
	      log_in @user
	      format.html { redirect_to @user }
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
