class AddBillableToWages < ActiveRecord::Migration[5.0]
  def change
    add_column :wages, :billable, :integer
  end
end
