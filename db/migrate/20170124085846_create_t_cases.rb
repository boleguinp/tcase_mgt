class CreateTCases < ActiveRecord::Migration[5.0]
  def change
    create_table :t_cases do |t|
      t.string :t_case_id
      t.text :title
      t.text :scenario
      t.string :status
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
