class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.references :user, foreign_key: true
      t.string :name, presence: true, default: "Add Device Name"
      t.string :location
      t.time :morning_start
      t.time :morning_end
      t.boolean :temp, default: true, null: false
      t.boolean :time, default: true, null: false

      t.timestamps
    end
  end
end
