class Company < ActiveRecord::Base
  has_many :company_phones
  
  # revise the company before the phones association is modified
  has_many :phones, :through => :company_phones, :dependent => :destroy, :before_add => :revise_for_phone_changes, :before_remove => :revise_for_phone_changes
  
  acts_as_revisable
  
  protected
    def revise_for_phone_changes(phone)
      self.revise!
    end
end
