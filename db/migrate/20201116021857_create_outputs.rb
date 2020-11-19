class CreateOutputs < ActiveRecord::Migration[6.0]
  def change
    create_table :outputs do |t|
      t.string :title, null: false
      t.string :text, null: false
      t.bigint :type_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
