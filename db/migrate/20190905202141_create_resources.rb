class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :author
      t.string :ref
      t.string :type
      t.float :rating
      t.float :progress

      t.timestamps
    end
  end
end
