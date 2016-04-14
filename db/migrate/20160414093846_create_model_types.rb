class CreateModelTypes < ActiveRecord::Migration
  def change
    create_table :model_types do |t|
      t.belongs_to :model, index: true
      t.string :name
      t.string :model_type_slug
      t.string :model_type_code
      t.integer :base_price

      t.timestamps
    end
  end
end
