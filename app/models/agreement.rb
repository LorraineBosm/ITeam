class Agreement < ApplicationRecord
  enum status: [:untouched, :in_repair, :repaired]

  belongs_to :device_model, optional: true
  has_one :request
  belongs_to :acceptor, class_name: 'User', foreign_key: 'acceptor_id'
  belongs_to :technician, class_name: 'User', foreign_key: 'technician_id', optional: true
  has_many :agreements_users
  has_many :users, through: :agreements_users

  def self.open_file(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, csv_options: { encoding: Encoding::UTF_8 })
      when ".xls" then Roo::Excel.new(file.path, xls_options: { encoding: Encoding::UTF_8 })
      when ".xlsx" then Roo::Excelx.new(file.path, xlsx_options: { encoding: Encoding::UTF_8 })
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.to_csv(options = {})
    attributes = %w{agreement_code imei contents problem first_name last_name phone_number created_at}
    CSV.generate(encoding: Encoding::WINDOWS_1251) do |csv|
      csv << attributes
      all.each do |risk|
        csv << risk.attributes.values_at(*attributes)
      end
    end
  end
end
