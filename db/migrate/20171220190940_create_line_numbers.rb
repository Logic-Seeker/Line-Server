class CreateLineNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :line_numbers do |t|
      t.text :content

      t.timestamps
    end
  end
end
