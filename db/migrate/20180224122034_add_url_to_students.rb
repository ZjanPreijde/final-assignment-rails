class AddUrlToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :image_url, :string
  end
end
