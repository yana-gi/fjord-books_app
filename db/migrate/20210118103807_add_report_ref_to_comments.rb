class AddReportRefToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :report, null: false, foreign_key: true
  end
end
