class IncludedPartsController < ApplicationController
  before_action :set_included_part, only: [:show, :edit, :update, :destroy]

  # GET /included_parts
  # GET /included_parts.json
  def index
    @included_parts = IncludedPart.all
  end

  # GET /included_parts/1
  # GET /included_parts/1.json
  def show
  end

  # GET /included_parts/new
  def new
    @included_part = IncludedPart.new
  end

  # GET /included_parts/1/edit
  def edit
  end

  # POST /included_parts
  # POST /included_parts.json
  def create
    @included_part = IncludedPart.new(included_part_params)

    respond_to do |format|
      if @included_part.save
        format.html { redirect_to invoices_url, notice: 'Included part was successfully created.' }
        format.json { render :show, status: :created, location: @included_part }
      else
        format.html { render :new }
        format.json { render json: @included_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /included_parts/1
  # PATCH/PUT /included_parts/1.json
  def update
    respond_to do |format|
      if @included_part.update(included_part_params)
        format.html { redirect_to @included_part, notice: 'Included part was successfully updated.' }
        format.json { render :show, status: :ok, location: @included_part }
      else
        format.html { render :edit }
        format.json { render json: @included_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /included_parts/1
  # DELETE /included_parts/1.json
  def destroy
    @included_part.destroy
    respond_to do |format|
      format.html { redirect_to included_parts_url, notice: 'Included part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_included_part
      @included_part = IncludedPart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def included_part_params
      params.require(:included_part).permit(:part_id, :inv_id)
    end
end
