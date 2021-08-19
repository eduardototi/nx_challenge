class LoansController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def create
		@loan = Loan.new(value: params[:value],
								     taxa: params[:taxa],
								     parcelas: params[:parcelas] || 12)
    if @loan.save
      render json: { loan: { id: @loan.id } }
    else
		  render :json => { :errors => @loan.errors.full_messages }
    end
  end

  def show
		@loan = Loan.find(params[:id])
		if @loan
    	render json: { loan: { id: @loan.id, pmt: @loan.pmt} }
		end
  end

	private

	def not_found
		render json: { error: 'Loan not found' }, status: :not_found
	end

end
