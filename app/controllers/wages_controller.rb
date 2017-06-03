class WagesController < ApplicationController
  before_action :set_wage, only: [:show, :edit, :update, :destroy]

  # GET /wages
  # GET /wages.json
  def index
    @wages = Wage.all
    @wages.each do |wage|
      wage.billable = billable(wage)
    end
  end

  # GET /wages/1
  # GET /wages/1.json
  def show
    @wage.billable = billable(@wage)
  end

  # GET /wages/new
  def new
    @wage = Wage.new
  end

  # GET /wages/1/edit
  def edit
  end

  # POST /wages
  # POST /wages.json
  def create
    @wage = Wage.new(wage_params)

    respond_to do |format|
      if @wage.save
        format.html { redirect_to @wage, notice: 'Wage was successfully created.' }
        format.json { render :show, status: :created, location: @wage }
      else
        format.html { render :new }
        format.json { render json: @wage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wages/1
  # PATCH/PUT /wages/1.json
  def update
    respond_to do |format|
      if @wage.update(wage_params)
        format.html { redirect_to @wage, notice: 'Wage was successfully updated.' }
        format.json { render :show, status: :ok, location: @wage }
      else
        format.html { render :edit }
        format.json { render json: @wage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wages/1
  # DELETE /wages/1.json
  def destroy
    @wage.destroy
    respond_to do |format|
      format.html { redirect_to wages_url, notice: 'Wage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def billable(wage)
    billable_wages = 0
    if (wage.hours != nil)
      billable_wages += (wage.hours * wage.hourly_rate)
    end
    if (wage.minutes != nil)
      billable_wages += ((wage.minutes / 60.0) * wage.hourly_rate)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wage
      @wage = Wage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wage_params
      params.require(:wage).permit(:date, :hours, :minutes, :hourly_rate)
    end
end
