class Phone < ActiveRecord::Base
  has_many :company_phones
  has_one :company, :through => :company_phones
  
  acts_as_revisable
  
  after_revise :revise_company
  
  protected
    def revise_company
      company(true).revise!
    end
end
