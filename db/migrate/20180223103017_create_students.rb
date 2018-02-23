class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_score
      t.references :batch, foreign_key: true

      t.timestamps
    end
  end
end
