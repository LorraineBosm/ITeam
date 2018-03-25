class CreateAgreements < ActiveRecord::Migration[5.1]
  def change
    create_table :agreements do |t|
      t.string :agreement_code, null: false
      t.string :imei, null: false
      t.text :contents, null: false # the things that user provides with device
      t.text :problem, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number, null: false
      t.boolean :is_printed, null: false, default: false
      t.references :device_model, null: true
      t.references :request, null: true
      t.timestamps
    end

    create_table :agreements_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :agreement, index: true
    end
  end
end
