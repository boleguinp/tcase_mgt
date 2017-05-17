class AddLeadToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :lead, :string
  end
end
