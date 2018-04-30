class AgreementsController < ApplicationController
  before_action :set_agreement, only: [:show, :edit, :update, :destroy, :start_repair]
  before_action except: [:repair, :in_repair] { has_access?('acceptor') }
  before_action only: [:repair, :in_repair] { has_access?('technician') }

  def index
    @agreements = Agreement.all
  end

  def show
    @request = Request.find(@agreement.request_id) unless @agreement.request_id.nil?
    respond_to do |format|
      format.html
      format.pdf { render pdf: 'agreement', template: 'agreements/show.pdf', encoding: 'utf8' }
    end
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
    if params[:request_id].nil?
      @request = Request.new
    else
      @request = Request.find(params[:request_id])
    end
  end

  def create
    @agreement = Agreement.new(agreement_params)
    @agreement.agreement_code = DateTime.now.strftime('%y%-m%-d%l%M%S').to_s + Random.rand(100..999).to_s
    @agreement.acceptor_id = current_user.id

    if @agreement.save
      redirect_to @agreement, notice: 'Agreement was successfully created.'
    else
      render :new
    end
  end

  def update
    @agreement.update_attributes(agreement_params)
    @agreement.status = :repaired if @agreement.percentage == 100
    if @agreement.save!
      respond_to do |format|
        format.html { redirect_to @agreement, notice: 'Agreement was successfully updated.' }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @agreement.destroy
    redirect_to agreements_url, notice: 'Agreement was successfully destroyed.'
  end

  def start_repair
    @agreement.update!(technician_id: current_user.id, status: 1)
    render :show
  end

  def in_repair
    @agreements = Agreement.where(technician_id: current_user.id, status: 1)
    render :index
  end

  private
  def set_agreement
    @agreement = Agreement.includes(device_model: [device_brand: [:device_type]]).find(params[:id])
  end

  def agreement_params
    params.require(:agreement).permit(:imei, :contents, :problem, :first_name, :last_name, :phone_number, :request_id, :device_model_id, :percentage)
  end

  def check_exists
    return false if params[:request_id].nil? || Agreement.where(request_id: params[:request_id]).empty?
    true
  end
end
