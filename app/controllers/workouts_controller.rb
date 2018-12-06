 class WorkoutsController < ApplicationController


	get '/workouts' do 
        @workouts = Workout.all
        erb :'workouts/index'
    end

    get '/workouts/new' do 
		erb :'/workouts/new'		
	end


	post '/workouts' do

		if !logged_in?
			redirect '/'
		end

		if params[:description] != "" && params[:name] != ""
      flash[:message] = "Successfully created workout"
	
			@workout = Workout.create(description: params[:description], name: params[:name], user_id: current_user.id)
      redirect "/workouts/#{@workout.id}"
		else
      flash[:error] = "All fields are required"
			redirect '/workouts/new'
		 end
	  end
    

    get '/workouts/:id' do
    	@workout = Workout.find(params[:id])
    	erb :'/workouts/show'

    end


    get '/workouts/:id/edit' do
      #binding.pry
    	@workout = Workout.find(params[:id])
        if logged_in?
          if @workout.user == current_user
    	       erb :'/workouts/edit'
           else
            redirect "users/#{current_user.id}"
           end
        else
           redirect '/'
        
        end
    end
 

    

    patch '/workouts/:id' do
      #binding.pry
         @workout = Workout.find(params[:id])
         if logged_in?
          if @workout.user == current_user && params[:description] && params[:name] != ""
            flash[:message] = "Workout successfully updated!"
               @workout.update(description: params[:description], name: params[:name])
                redirect "/workouts/#{@workout.id}"
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
     end
 end

    
    delete '/workouts/:id' do 
       @workout = Workout.find(params[:id])
       if @workout.user == current_user
        flash[:message] = "Workout successfully deleted."
          @workout.destroy
          redirect "users/#{current_user.id}" 
       else
          redirect '/workouts'

     end
   end
      

end
