class PhoneRevision < ActiveRecord::Base
  acts_as_revision
  has_many :company_phones, :foreign_key => 'phone_id'
  has_one :company, :through => :company_phones
  disable_revisable_scope :company
end
