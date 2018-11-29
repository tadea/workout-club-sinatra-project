class UsersController < ApplicationController

  get '/login' do   
    erb :login
  end

  post '/login' do
    @user = User.find_by(email: params[:email])  
    if @user && @user.authenticate(params[:password])
     
      session[:user_id] = @user.id 
  
      puts session
      redirect "users/#{@user.id}"   
    else  
      flash[:message] = "The email and password you entered did not match our records. Please try again."
     redirect '/login'
    end
  end

  get '/signup' do
      erb :signup
  end

  post '/users' do
    if params[:name] != "" && params[:email] != "" && params[:password] != "" 
      @user = User.create(params)
      session[:user_id] = @user.id 
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "All fields are required"
      redirect '/signup'
    end
  end

   
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

	
end