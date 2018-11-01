class UsersController < ApplicationController

	get '/login' do
     erb :login
    end

    post '/login' do 
    	@user = User.find_by(email: params[:email]) #find user by params

    	if @user.authenticate(params[:password]) #if valid then log in and create users session
    		session[:user_id] = @user.id 
    		redirect "users/#{@user.id}"
    	else #redirect


    	end
    end

    get 'users/id' do
    	
    end

	

end