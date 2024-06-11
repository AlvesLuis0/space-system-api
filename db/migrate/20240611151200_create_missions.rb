# frozen_string_literal: true

class CreateMissions < ActiveRecord::Migration[7.1]
  def change
    create_table :missions do |t|
      t.string :name
      t.date :launch_date
      t.string :destination
      t.string :status
      t.string :crew
      t.integer :duration_in_days
      t.decimal :cost
      t.text :details

      t.timestamps
    end
  end
end
