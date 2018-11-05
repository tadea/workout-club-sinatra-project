class UsersController < ApplicationController

	get '/login' do   
     erb :login
    end

    post '/login' do
    @user = User.find_by(email: params[:email])# Find the user
   
    if @user.authenticate(params[:password]) # Authenticate the user  # log the user in - create the user session

      session[:user_id] = @user.id # actually logging the user in
      # redirect to the user's show page
      puts session
      redirect "users/#{@user.id}"
    else
      # tell the user they entered invalid credentials
      # redirect them to the login page
    end
  end

   

    get '/signup' do
    	erb :signup  
    end

      get '/logout' do
    session.clear
    redirect '/'
  end

	

end