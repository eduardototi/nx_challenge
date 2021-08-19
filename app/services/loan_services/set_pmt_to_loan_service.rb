module LoanServices
	class SetPmtToLoanService

    def initialize(id)
      @loan = Loan.find(id)
      i = @loan.taxa / 100
      n = @loan.parcelas
      pv = @loan.value
      pt = ((1 + i)** n) -1
      px = ((1 + i) ** n * i)
      pmt = pv / (pt / px)
      @loan.pmt = pmt.floor(2)
      @loan.save
    end
    
  end
end
