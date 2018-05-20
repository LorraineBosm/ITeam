class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :destroy]
  before_action except: [:start, :create] { has_access?('acceptor') }
  before_action :requests_filtered_by_date, only: [:export]

  def index
    @requests = Request.includes(:agreement).paginate(page: params[:page], per_page: 6).order('created_at DESC')
  end

  def show
  end

  def create
    @request = Request.new(request_params)

    if @request.save
      redirect_to start_requests_path, notice: I18n.t('controllers.requests.request_created')
    else
      render :start, layout: 'application_clean'
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_url, notice: I18n.t('controllers.requests.request_destroyed')
  end

  def start
    @request = Request.new
    render layout: 'application_clean'
  end

  def export
    respond_to do |format|
      format.html
      format.csv do
        send_data @requests.to_csv, filename: 'requests.csv'
      end
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename="requests.xls"'
      }
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="requests.xlsx"'
      }
    end
  end

  private
  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:problem_desc, :first_name, :last_name, :phone_number, :device_model_id)
  end

  def requests_filtered_by_date
    if empty_date?(params[:start_date]) && empty_date?(params[:end_date])
      @requests = Request.all
    elsif empty_date?(params[:start_date])
      @requests = Request.where("created_at <= ?", params[:end_date])
    elsif empty_date?(params[:end_date])
      @requests = Request.where("created_at >= ?", params[:start_date])
    else
      @requests = Request.where(created_at: params[:start_date]..params[:end_date])
    end
  end

  def empty_date? date
    (date.nil? || !date.present?) ? true : false
  end
end
