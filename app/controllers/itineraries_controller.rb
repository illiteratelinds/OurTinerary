class ItinerariesController < ApplicationController
    before_action :set_itinerary, only: [:show, :edit, :update, :destroy]

  def index
    @itineraries = Itinerary.all
  end  

  def show
  end

  def new
    @itinerary = Itinerary.new
  end

  def edit
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user = current_user
    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to @itinerary, notice: 'Itinerary was successfully created.' }
        format.json { render :show, status: :created, location: @itinerary }
      else
        format.html { render :new }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @itinerary.update(itinerary_params)
        format.html { redirect_to @itinerary, notice: 'Itinerary was successfully updated.' }
        format.json { render :show, status: :ok, location: @itinerary }
      else
        format.html { render :edit }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @itinerary.destroy
    respond_to do |format|
      format.html { redirect_to itineraries_url, notice: 'Itinerary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_itinerary
      @itinerary = Itinerary.find(params[:id])
    end

    def itinerary_params
      params.require(:itinerary).permit(:title, :start_date, :end_date, :user_id)
    end
end
