class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.belongs_to :organization, index: true
      t.string :name
      t.string :model_slug

      t.timestamps
    end
  end
end
