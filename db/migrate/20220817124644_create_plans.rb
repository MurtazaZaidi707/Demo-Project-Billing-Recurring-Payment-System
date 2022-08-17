class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.integer :monthly_fee
      t.string :name

      t.timestamps
    end
  end
end
