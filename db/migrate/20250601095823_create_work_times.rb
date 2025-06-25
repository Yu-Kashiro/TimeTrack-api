class CreateWorkTimes < ActiveRecord::Migration[7.2]
  def change
    create_table :work_times do |t|
      t.references :user, null: false, foreign_key: true
      t.date :work_date, null: false
      t.time :clock_in
      t.time :clock_out
      t.integer :work_minute, null: false, default: 0
      t.integer :break_duration_minute, null: false, default: 0
      t.text :note
      t.boolean :approved, null: false, default: false
      t.datetime :approved_at
      t.integer :approved_by_id

      t.timestamps
    end

    add_index :work_times, [ :user_id, :work_date ], unique: true
    add_foreign_key :work_times, :users, column: :approved_by_id
  end
end
