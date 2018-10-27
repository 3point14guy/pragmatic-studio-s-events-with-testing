class AddImageAndCapacityToEvents < ActiveRecord::Migration[5.2]
  # setting default values so objects aren't created with nil values
  def change
    add_column :events, :image_file_name, :string, default: ""
    add_column :events, :capacity, :integer, default: 1
  end
end
