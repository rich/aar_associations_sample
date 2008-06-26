class MakePhoneRevisable < ActiveRecord::Migration
  def self.up
        add_column :phones, :revisable_original_id, :integer
        add_column :phones, :revisable_branched_from_id, :integer
        add_column :phones, :revisable_number, :integer
        add_column :phones, :revisable_name, :string
        add_column :phones, :revisable_type, :string
        add_column :phones, :revisable_current_at, :datetime
        add_column :phones, :revisable_revised_at, :datetime
        add_column :phones, :revisable_deleted_at, :datetime
        add_column :phones, :revisable_is_current, :boolean
      end

  def self.down
        remove_column :phones, :revisable_original_id
        remove_column :phones, :revisable_branched_from_id
        remove_column :phones, :revisable_number
        remove_column :phones, :revisable_name
        remove_column :phones, :revisable_type
        remove_column :phones, :revisable_current_at
        remove_column :phones, :revisable_revised_at
        remove_column :phones, :revisable_deleted_at
        remove_column :phones, :revisable_is_current
      end
end
