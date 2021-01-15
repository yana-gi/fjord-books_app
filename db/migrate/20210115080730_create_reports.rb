class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
