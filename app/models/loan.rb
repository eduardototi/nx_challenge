class Loan < ApplicationRecord
  validates :value, presence: true
  validates :taxa, presence: true

  after_create :set_pmt

  def set_pmt
    LoanServices::SetPmtToLoanService.new(self.id)
  end
end
