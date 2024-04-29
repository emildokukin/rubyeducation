class ValuesController < ApplicationController
  before_action :set_value, only: %i[ show update destroy ]

  # GET /values
  def index
    @values = Value.all

    render json: @values
  end

  # GET /values/1
  def show
    render json: @value
  end

  # POST /values
  def create
    @value = Value.new(value_params)

    if @value.save
      render json: @value, status: :created, location: @value
    else
      render json: @value.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /values/1
  def update
    if @value.update(value_params)
      render json: @value
    else
      render json: @value.errors, status: :unprocessable_entity
    end
  end

  # DELETE /values/1
  def destroy
    @value.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_value
      @value = Value.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def value_params
      params.require(:value).permit(:user_id, :image_id, :value, :integer)
    end
end
