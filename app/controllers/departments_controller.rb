class DepartmentsController < ApplicationController

  def all_departments
  	departments = Department.all
  	render json: departments, status: 200
  end

  def show_department
  	if department = Department.find_by(name: params["name"])
  	  render json: department, serializer: DepartmentSerializer, status: 201
  	else 
  	  render json: { errors: department.errors.full_messages }, status: 422
  	end
  end

end

