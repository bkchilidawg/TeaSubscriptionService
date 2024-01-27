class ChangeDescriptionToStringInTeas < ActiveRecord::Migration[7.1]
  def change
    change_column :teas, :description, :string
  end
end