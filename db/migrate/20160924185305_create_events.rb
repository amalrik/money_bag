class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :description
      t.integer :kind
      t.monetize :amount, null: false, default: 0
      t.integer :dashboard_id, index: true
      t.timestamps
    end
  end
end
