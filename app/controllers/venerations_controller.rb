class VenerationsController < ApplicationController
  before_action :set_own_veneration, only: [:edit, :update, :destroy]
  before_action :authenticate!, except: [:index, :show]

  # GET /venerations
  # GET /venerations.json
  def index
    @current_user = current_user
    @venerations = Veneration.all
  end

  # GET /venerations/1
  # GET /venerations/1.json
  def show
    @veneration = Veneration.find(params[:id])
  end

  # GET /venerations/new
  def new
    @veneration = current_user.venerations.new
  end

  # GET /venerations/1/edit
  def edit
  end

  # POST /venerations
  # POST /venerations.json
  def create
    @veneration = current_user.venerations.new(veneration_params)

    respond_to do |format|
      if @veneration.save
        format.html { redirect_to @veneration, notice: "Veneration was successfully created." }
        format.json { render :show, status: :created, location: @veneration }
      else
        format.html { render :new }
        format.json { render json: @veneration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venerations/1
  # PATCH/PUT /venerations/1.json
  def update
    respond_to do |format|
      if @veneration.update(veneration_params)
        format.html { redirect_to @veneration, notice: "Veneration was successfully updated." }
        format.json { render :show, status: :ok, location: @veneration }
      else
        format.html { render :edit }
        format.json { render json: @veneration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venerations/1
  # DELETE /venerations/1.json
  def destroy
    @veneration.destroy
    respond_to do |format|
      format.html { redirect_to venerations_url, notice: "Veneration was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_own_veneration
    @veneration = current_user.venerations.find(params[:id])
  end

  def veneration_params
    params.require(:veneration).permit(:caption, :score, :image)
  end
end
