module AnalyticsHelper

  def group_by_device_types source
    types = Hash.new(0)
    source.each do |r|
      if r.device_model.nil?
        types['Unknown'] += 1
      else
        types[r.device_model.device_brand.device_type.name] += 1
      end
    end
    types
  end

  def group_by_device_brands source
    brands = Hash.new(0)
    source.each do |r|
      if r.device_model.nil?
        brands['Unknown'] += 1
      else
        brands[r.device_model.device_brand.short_name] += 1
      end
    end
    brands
  end

  def group_by_device_models source
    models = Hash.new(0)
    source.each do |r|
      if r.device_model.nil?
        models['Unknown'] += 1
      else
        models[r.device_model.name] += 1
      end
    end
    models
  end
end
