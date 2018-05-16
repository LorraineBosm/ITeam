class AnalyticsController < ApplicationController
  before_action { has_access?('analyst') }
  def index
  end

  def requests
    @requests = Request.includes(device_model: [device_brand: [:device_type]])
  end

  def agreements
    @agreements = Agreement.includes(device_model: [device_brand: [:device_type]])
  end
end
