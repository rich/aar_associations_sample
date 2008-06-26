class PhoneRevision < ActiveRecord::Base
  acts_as_revision
  
  # We're joing this model as a Phone through the company_phones
  # table so we need to specify the foreign_key otherwise activerecord
  # will build one based on the name of the model class
  has_many :company_phones, :foreign_key => 'phone_id'
  has_one :company, :through => :company_phones
  
  # We're joing the *Revision classes through here so
  # we need to specify the foreign_key otherwise activerecord
  # will build one based on the name of the model class
  disable_revisable_scope :company
end
