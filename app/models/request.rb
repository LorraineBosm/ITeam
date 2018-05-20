class Request < ApplicationRecord
  attr_accessor :device_type, :device_brand

  belongs_to :device_model, optional: true
  has_one :agreement

  validates :problem_desc, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

  def self.open_file(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, csv_options: { encoding: Encoding::UTF_8 })
      when ".xls" then Roo::Excel.new(file.path, xls_options: { encoding: Encoding::UTF_8 })
      when ".xlsx" then Roo::Excelx.new(file.path, xlsx_options: { encoding: Encoding::UTF_8 })
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.to_csv(options = {})
    attributes = %w{problem_desc first_name last_name phone_number created_at}
    CSV.generate(encoding: Encoding::UTF_8) do |csv|
      csv << attributes
      all.each do |risk|
        csv << risk.attributes.values_at(*attributes)
      end
    end
  end
end
