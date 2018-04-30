class AddDefaultValueForUserFirstLastName < ActiveRecord::Migration[5.1]
  def change
    User.all.each do |u|
      u.update!(first_name:'', last_name:'')
    end
    change_column :users, :first_name, :string, null: false, default: ""
    change_column :users, :last_name, :string, null: false, default: ""
  end
end
