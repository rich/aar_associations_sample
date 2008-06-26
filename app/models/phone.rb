class Phone < ActiveRecord::Base
  has_many :company_phones
  has_one :company, :through => :company_phones
  
  acts_as_revisable
  
  # after a phone is revised we should revise the company
  after_revise :revise_company
  
  protected
    # This method will actually be called through the course of a Company
    # being revised because when a Company is revised it creates it's
    # CompanyRevision and when a CompanyRevision is created it loops
    # through all the Company's phones and revises them.
    # 
    # This method is safe from causing a loop because acts_as_revisable
    # tracks the current state of it's models and prevents infinite loops
    # such as this. So this just works when we want it to and is a no-op
    # when it shouldn't do anything.
    def revise_company
      company(true).revise!
    end
end
