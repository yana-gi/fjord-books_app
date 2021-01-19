class RemoveReportToComment < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :report_id, :references
  end
end
