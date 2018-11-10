class WorkoutsController < ApplicationController

	get '/workouts/new' do 
		erb :'/workouts/new'		
	end

	post '/workouts' do
		if !logged_in?
			redirect '/'
		if params[:content] != ""
			user = User.find_by_id(session[:user_id])
			@workout = Workout.create(params)
			redirect "/workouts/#{@workout.id}"
		else
			redirect '/workouts/new'
		 end
	  end
    end

end