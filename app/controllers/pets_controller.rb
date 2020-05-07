class PetsController < ApplicationController

    def index
        @pets = Pet.all
    end

    def new
        @shelter = Shelter.find(params[:shelter_id])
    end

    def create
        shelter = Shelter.find(params[:shelter_id])
        pet = shelter.pets.create(pet_params)
        redirect_to "/shelters/#{shelter.id}/pets"
    end

    def show
        @pet = Pet.find(params[:pet_id])
    end

    def edit
        @pet = Pet.find(params[:pet_id])
    end
    
    def update
        pet = Pet.find(params[:pet_id])
        pet.update(pet_params)
        redirect_to "/pets/#{pet.id}"
    end

    def destroy
        pet = Pet.find(params[:pet_id])
        pet.delete
        redirect_to pets_path
    end
    
    private

    def pet_params
        params.permit(:name, :image, :sex, :description, :age)
    end
end