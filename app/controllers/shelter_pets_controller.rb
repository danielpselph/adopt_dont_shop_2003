class ShelterPetsController < ApplicationController

    def index
        @shelter = Shelter.find(params[:shelter_id])
        @pets = @shelter.pets.all
    end

    # def new
    #     # binding.pry
    #     # @shelter_id = params[:shelter_id]

    # end
    
    

end