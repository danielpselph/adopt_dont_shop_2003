class ShelterPetsController < ApplicationController

    def index
        @shelter = Shelter.find(params[:shelter_id])
        @pets = @shelter.pets.all
    end
end