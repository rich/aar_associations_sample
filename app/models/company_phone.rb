class CompanyPhone < ActiveRecord::Base
  belongs_to :company, :foreign_key => 'company_id'
  belongs_to :phone, :foreign_key => 'phone_id'
end
