class CompanyPhone < ActiveRecord::Base
  # We're joing the *Revision classes through here so
  # we need to specify the foreign_key otherwise activerecord
  # will build one based on the name of the model class
  belongs_to :company, :foreign_key => 'company_id'
  belongs_to :phone, :foreign_key => 'phone_id'
end
