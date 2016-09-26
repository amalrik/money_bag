class CreateDashboards < ActiveRecord::Migration[5.0]
  def change
    create_table :dashboards do |t|
      t.integer :user_id, index: true
      t.monetize :balance, default: 0

      t.timestamps
    end
  end
end
