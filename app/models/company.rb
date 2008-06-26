class Company < ActiveRecord::Base
  has_many :company_phones
  has_many :phones, :through => :company_phones, :dependent => :destroy, :before_add => :revise_for_new_phone
  
  acts_as_revisable
  
  protected
    def revise_for_new_phone(phone)
      self.revise!
    end
end
