class AnalyticsController < ApplicationController
  def index
  end

  def requests
    @requests = Request.includes(device_model: [device_brand: [:device_type]])
  end

  def agreements
    @agreements = Agreement.includes(device_model: [device_brand: [:device_type]])
  end

  def users
  end
end
