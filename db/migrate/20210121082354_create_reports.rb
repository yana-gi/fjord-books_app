# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :text
      t.references :user, null: false, foreign_key: true, default: ''

      t.timestamps
    end
  end
end
