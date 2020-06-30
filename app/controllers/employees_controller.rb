class EmployeesController < ApplicationController

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to company_path(@employee.company)
        else
            render :new
        end
    end

    def destroy
        @employee = Employee.find(params[:id])
        @company = @employee.company
        @employee.delete
        redirect_to company_path(@company)
    end

    private
    def employee_params
        params.require(:employee).permit(:name, :title, :company_id)
    end
    
end