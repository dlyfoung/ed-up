class AddTagToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :tag, :string
  end
end
