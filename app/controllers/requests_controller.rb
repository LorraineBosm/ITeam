class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :destroy]
  before_action :is_acceptor?, only: [:index]

  def index
    @requests = Request.includes(:agreement).all
  end

  def show
  end

  def create
    @request = Request.new(request_params)

    if @request.save
      redirect_to @request, notice: 'Request was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_url, notice: 'Request was successfully destroyed.'
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
