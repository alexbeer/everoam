class ProfilesController < ApplicationController
  def show



	@user = User.find_by_username(params[:id])
	if @user
		@roams = @user.roams.all
		render action: :show
	else

  	render file: 'public/404', status: 404, formats: [:html]
  	end


  end
end
