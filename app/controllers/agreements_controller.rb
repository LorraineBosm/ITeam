class AgreementsController < ApplicationController
  before_action :set_agreement, only: [:show, :edit, :update, :destroy, :repair]
  before_action { has_role?('acceptor') }

  def index
    @agreements = Agreement.all
  end

  def show
    @request = Request.find(@agreement.request_id)
  end

  def new
    redirect_to requests_path if check_exists
    @agreement = Agreement.new
    if params[:request_id].nil?
      @request = Request.new
    else
      @request = Request.find(params[:request_id])
    end
  end

  def edit
    redirect_to agreements_path if @agreement.is_printed?
    if params[:request_id].nil?
      @request = Request.new
    else
      @request = Request.find(params[:request_id])
    end
  end

  def create
    @agreement = Agreement.new(agreement_params)
    @agreement.agreement_code = 'AA' + DateTime.now.strftime('%Y%m%d').to_s + Random.rand(10..19).to_s
    @agreement.acceptor_id = current_user.id

    if @agreement.save
      redirect_to @agreement, notice: 'Agreement was successfully created.'
    else
      render :new
    end
  end

  def update
    if @agreement.update(agreement_params)
      redirect_to @agreement, notice: 'Agreement was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @agreement.destroy
    redirect_to agreements_url, notice: 'Agreement was successfully destroyed.'
  end

  def repair
    @agreement.update!(technician_id: current_user.id)
    render :show
  end

  def in_repair
    @agreements = Agreement.where(technician_id: current_user.id)
    render :index
  end

  private
    def set_agreement
      @agreement = Agreement.find(params[:id])
    end

    def agreement_params
      params.require(:agreement).permit(:imei, :contents, :problem, :first_name, :last_name,
                                        :phone_number, :request_id, :device_model_id)
    end

    def check_exists
      return false if (params[:request_id].nil? || Agreement.where(request_id: params[:request_id]).empty?)
      true
    end
end
