class Api::DogsController < ApplicationController

def create
  if current_user
  @dogs = Dog.new(
  name: params[:name],
  age: params[:age],
  breed: params[:breed],
  )

   if @dogs.save
     render "showdog.json.jb"
   else 
     render json: {errors: @dogs.errors.full_message }, status: 406
   end 
  else
     render json: {errors: "you must be logged in to create a dog"}, status: 401 
  end
end

end
