class WorkoutsController < ApplicationController

	get '/workouts' do
		@workout = Workout.all
		erb :'/users/show'
    end



	get '/workouts/new' do 
		erb :'/workouts/new'		
	end

	post '/workouts' do
		if !logged_in?
			redirect '/'
		end

		if params[:description] != "" && params[:name] != ""
			
			@workout = Workout.create(params)
			session[:user_id] = @workout.id 
			redirect "/workouts/#{@workout.id}"
		else
			redirect '/workouts/new'
		 end
	  end
    

    get '/workouts/:id' do
    	@workout = Workout.find_by_id(params[:id])
    	erb :'workouts/show'	
    end


    get '/workouts/:id/edit' do
    	@workout = Workout.find_by_id(params[:id])
      erb :'/workouts/edit'
    end

    patch '/workouts/:id' do
    	@workout = Workout.find_by_id(params[:id])
    	@workout.update(description: params[:description], name: params[:name])
    	@workout.save
    	redirect "/workouts/#{@workout.id}"
    end


end

