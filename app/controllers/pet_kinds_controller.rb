class PetKindsController < ApplicationController
  before_action :set_pet_kind, only: [:show, :edit, :update, :destroy]

  # GET /pet_kinds
  # GET /pet_kinds.json
  def index
    @pet_kinds = PetKind.all
  end

  # GET /pet_kinds/1
  # GET /pet_kinds/1.json
  def show
  end

  # GET /pet_kinds/new
  def new
    @pet_kind = PetKind.new
    @pet_kind.breeds.build
    @pet_kind.breeds.build
  end

  # GET /pet_kinds/1/edit
  def edit
  end

  # POST /pet_kinds
  # POST /pet_kinds.json
  def create
    @pet_kind = PetKind.new(pet_kind_params)

    respond_to do |format|
      if @pet_kind.save
        format.html { redirect_to @pet_kind, notice: 'Pet kind was successfully created.' }
        format.json { render :show, status: :created, location: @pet_kind }
      else
        format.html { render :new }
        format.json { render json: @pet_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_kinds/1
  # PATCH/PUT /pet_kinds/1.json
  def update
    respond_to do |format|
      if @pet_kind.update(pet_kind_params)
        format.html { redirect_to @pet_kind, notice: 'Pet kind was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet_kind }
      else
        format.html { render :edit }
        format.json { render json: @pet_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_kinds/1
  # DELETE /pet_kinds/1.json
  def destroy
    @pet_kind.destroy
    respond_to do |format|
      format.html { redirect_to pet_kinds_url, notice: 'Pet kind was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_kind
      @pet_kind = PetKind.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_kind_params
      params.require(:pet_kind).permit(:name, breeds_attributes: [:name, :trivia])
    end
end
