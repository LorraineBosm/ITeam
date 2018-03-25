class AgreementsController < ApplicationController
  before_action :set_agreement, only: [:show, :edit, :update, :destroy]
  before_action :is_acceptor?

  def index
    @agreements = Agreement.all
  end

  def show
  end

  def new
    @agreement = Agreement.new
    # @request = Request.find(params[:id]) unless params[:id].nil?
    if params[:request_id].nil?
      @request = Request.new
    else
      @request = Request.find(params[:request_id])
    end
  end

  def edit
  end

  def create
    @agreement = Agreement.new(agreement_params)
    @agreement.agreement_code = 'AA' + DateTime.now.strftime('%Y%m%d').to_s + Random.rand(10..19).to_s

    respond_to do |format|
      if @agreement.save
        format.html { redirect_to @agreement, notice: 'Agreement was successfully created.' }
        format.json { render :show, status: :created, location: @agreement }
      else
        format.html { render :new }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @agreement.update(agreement_params)
        format.html { redirect_to @agreement, notice: 'Agreement was successfully updated.' }
        format.json { render :show, status: :ok, location: @agreement }
      else
        format.html { render :edit }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @agreement.destroy
    respond_to do |format|
      format.html { redirect_to agreements_url, notice: 'Agreement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_agreement
      @agreement = Agreement.find(params[:id])
    end

    def agreement_params
      params.require(:agreement).permit(:imei, :contents, :problem, :first_name, :last_name,
                                        :phone_number, :request_id, :device_model_id)
    end
end
