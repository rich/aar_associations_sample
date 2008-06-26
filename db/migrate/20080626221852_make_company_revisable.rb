class MakeCompanyRevisable < ActiveRecord::Migration
  def self.up
        add_column :companies, :revisable_original_id, :integer
        add_column :companies, :revisable_branched_from_id, :integer
        add_column :companies, :revisable_number, :integer
        add_column :companies, :revisable_name, :string
        add_column :companies, :revisable_type, :string
        add_column :companies, :revisable_current_at, :datetime
        add_column :companies, :revisable_revised_at, :datetime
        add_column :companies, :revisable_deleted_at, :datetime
        add_column :companies, :revisable_is_current, :boolean
      end

  def self.down
        remove_column :companies, :revisable_original_id
        remove_column :companies, :revisable_branched_from_id
        remove_column :companies, :revisable_number
        remove_column :companies, :revisable_name
        remove_column :companies, :revisable_type
        remove_column :companies, :revisable_current_at
        remove_column :companies, :revisable_revised_at
        remove_column :companies, :revisable_deleted_at
        remove_column :companies, :revisable_is_current
      end
end
