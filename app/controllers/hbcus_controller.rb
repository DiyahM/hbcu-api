class HbcusController < ApplicationController
  before_action :set_hbcu, only: [:show, :update, :destroy]

  # GET /hbcus
  def index
    @hbcus = Hbcu.all

    render json: @hbcus
  end

  # GET /hbcus/1
  def show
    render json: @hbcu
  end

  # POST /hbcus
  def create
    @hbcu = Hbcu.new(hbcu_params)

    if @hbcu.save
      render json: @hbcu, status: :created, location: @hbcu
    else
      render json: @hbcu.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hbcus/1
  def update
    if @hbcu.update(hbcu_params)
      render json: @hbcu
    else
      render json: @hbcu.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hbcus/1
  def destroy
    @hbcu.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hbcu
      @hbcu = Hbcu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hbcu_params
      params.require(:hbcu).permit(:name, :street_address)
    end
end
