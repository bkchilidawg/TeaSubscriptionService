class UpdateSchema < ActiveRecord::Migration[7.1]
  def change
    change_column :customers, :address, :string

    change_column :subscriptions, :price, :integer
    execute "ALTER TABLE subscriptions ALTER COLUMN status TYPE integer USING (status::integer)"
    change_column_default :subscriptions, :status, 0
    execute "ALTER TABLE subscriptions ALTER COLUMN frequency TYPE integer USING (frequency::integer)"
  end
end