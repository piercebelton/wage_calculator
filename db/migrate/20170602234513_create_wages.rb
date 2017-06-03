class CreateWages < ActiveRecord::Migration[5.0]
  def change
    create_table :wages do |t|
      t.date :date
      t.integer :hours
      t.integer :minutes
      t.integer :hourly_rate

      t.timestamps
    end
  end
end
