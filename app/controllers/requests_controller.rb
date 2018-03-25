class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :destroy]
  before_action :is_acceptor?, only: [:index]

  def index
    @requests = Request.all
  end

  def show
  end

  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start
    @request = Request.new
    render layout: 'application_clean'
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:problem_desc, :first_name, :last_name, :phone_number, :device_model_id)
    end
end
