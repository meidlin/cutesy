class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.all
    # @users= Pet.user.all
    render json: @pets, each_serializer: PetSerializer
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    # @pet = Pet.find(params[:id])
    @ratings = Rating.find_by_sql("SELECT pet_id, AVG(CAST(rating AS DECIMAL)) AS bs FROM ratings GROUP BY pet_id;")
  end

  def leader
    @ratings = []
    Rating.find_by_sql("SELECT pet_id, AVG(CAST(rating AS DECIMAL)) AS bs FROM ratings GROUP BY pet_id ORDER BY 2 DESC LIMIT 25;").each do |rating|
      @ratings << {pet: Pet.where(id: rating.pet_id).first, rating: rating.bs}
    end
  end

  def post
    
  end

  def getpetUrl
    @pet = Pet.find(params[:id])
    @peturl = @pet.avatar.url(:original) 
    render json: @peturl
  end

  

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
    @edit = true
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = current_user.pets.new(pet_params)

    # TODO wipe this out later 
    # This assigns pet to user
    # @current_user = current_user
    # @current_user.pets << @pet

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Pet was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:age, :name, :sex, :description, :avatar, :breed_id)
    end
end
