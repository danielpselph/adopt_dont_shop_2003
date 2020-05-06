class ShelterPetsController < ApplicationController

    def index
        @shelter = Shelter.find(params[:shelter_id])
    end

    def new
        # binding.pry
        # @shelter_id = params[:shelter_id]

    end
    
    

end