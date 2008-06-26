class CompanyRevision < ActiveRecord::Base
  acts_as_revision
  has_many :company_phones, :foreign_key => 'company_id'
  has_many :phones, :through => :company_phones
  disable_revisable_scope :phones
  
  after_create :clone_phones
  
  protected
    def clone_phones
      company.phones.each do |phone|
        phone.revise!
        self.phones << phone.revisions.first.becomes(Phone)
      end
    end
end
