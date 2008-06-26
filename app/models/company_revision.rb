class CompanyRevision < ActiveRecord::Base
  acts_as_revision
  
  # We're joing this model as a Company through the company_phones
  # table so we need to specify the foreign_key otherwise activerecord
  # will build one based on the name of the model class
  has_many :company_phones, :foreign_key => 'company_id'
  has_many :phones, :through => :company_phones
  
  # This macro allows associations to find either revisables or 
  # revisions through the named association. Normally the scoping 
  # AAR performs scopes associations to whatever the class actually is
  disable_revisable_scope :phones
  
  # After this revision is created we clone the phone numbers from the 
  # revisable
  after_create :clone_phones
  
  protected
    def clone_phones
      # step through each phone in the revisable
      company.phones.each do |phone|
        # force a revision on each one
        phone.revise!
        
        # add the newly created revision to this CompanyRevision's
        # phones association
        self.phones << phone.revisions.first.becomes(Phone)
      end
    end
end
