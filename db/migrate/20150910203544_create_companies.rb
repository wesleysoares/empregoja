class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :phone
      t.string :mail
      t.string :location

      t.timestamps null: false
    end
  end
end
