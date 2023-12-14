class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)

    respond_to do |format|
      if @flat.save
        format.html { redirect_to flat_url(@flat), notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @flat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    respond_to do |format|
      if @flat.update(flat_params)
        format.html { redirect_to flat_url(@flat), notice: 'flat was successfully updated.' }
        format.json { render :show, status: :ok, location: @flat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :price_per_night, :description, :number_of_guests)
  end
end
