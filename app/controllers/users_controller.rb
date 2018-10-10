require 'pry'

class UsersController < ApplicationController
	def create
		@user = User.new(user_params)
		@user.total_time = 0
		@user.total_time.to_i
		@user.profile_url = "https://i0.wp.com/dailycupofyoga.com/wp-content/uploads/2011/11/tumblr_luo25sxgzi1qdyb9oo1_4002.png"

		if @user.save
			render json: @user
		end	
	end

	def show
		@user = User.find(params[:id])

		respond_to do |f|
			f.json { render json: @user }
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.meditation_sessions.destroy_all
		@user.destroy

		respond_to do |f|
			f.json { render json: '200' }
		end
	end

	def login
		@user = User.find_by(:email => params[:login_user][:email])

		if !@user
			render json: {error_message: "User doesn't exist."}
		elsif !@user.authenticate(params[:login_user][:password])
			render json: {error_message: "Incorrect password."}
		else
			render json: @user
		end
	end

	private

	def user_params
		params.require(:new_user).permit(:name, :last_name, :location, :password, :email)
	end

	def login_params
		params.require(:login_user).permit(:email, :password)
	end
end
