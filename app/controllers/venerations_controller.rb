class VenerationsController < ApplicationController
  before_action :set_own_veneration, only: [:show, :edit, :update, :destroy]
  before_action :authenticate!, except: [:index, :show]

  # GET /venerations
  def index
    scope = params[:own] ? current_user.venerations : Veneration.where(nil)
    scope = scope.where(score: params[:score]) if params[:score]

    @venerations = scope.page params[:page]
  end

  # GET /venerations/1
  def show
  end

  # GET /venerations/new
  def new
    @veneration = current_user.venerations.new
  end

  # GET /venerations/1/edit
  def edit
  end

  # POST /venerations
  def create
    @veneration = current_user.venerations.new(veneration_params)
    if @veneration.save
      redirect_to @veneration, notice: "Veneration was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /venerations/1
  def update
      if @veneration.update(veneration_params)
        redirect_to @veneration, notice: "Veneration was successfully updated."
      else
        render :edit
      end
  end

  # DELETE /venerations/1
  def destroy
    @veneration.destroy
    redirect_to venerations_url, notice: "Veneration was successfully destroyed."
  end

  private

  def set_own_veneration
    @veneration = current_user.venerations.find(params[:id])
  end

  def veneration_params
    params.require(:veneration).permit(:caption, :score, :image)
  end
end
