class CompaniesController < ApplicationController
    before_action :set_company, only: [:show, :edit, :update]

    def new
        @company = Company.new
    end
    
    def show
        @employee = Employee.new
    end

    def create
        @company = Company.new(company_params)
        if @company.save
            redirect_to @company
        else 
            render :new
        end
    end


    private
    def company_params
        params.require(:company).permit(:name, :employee)
    end

    def set_company
        @company = Company.find(params[:id])
    end
end