class CreateCompanyPhones < ActiveRecord::Migration
  def self.up
    create_table :company_phones do |t|
      t.references :company
      t.references :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :company_phones
  end
end
