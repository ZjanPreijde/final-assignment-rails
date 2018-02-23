class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.string :score
      t.string :remarks
      t.references :batch, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
