class Employee < ActiveRecord::Base
  acts_as_superclass
  acts_as :user

  def self.new_from_old(responsibility, old_employee)
    if ['Teacher', 'Manager'].include?(responsibility)
      new_employee = responsibility.constantize.new(old_employee.user.attributes.except(:id).merge(responsibility: responsibility))
    else
      new_employee = Employee.new(old_employee.user.attributes.except(:id).merge(responsibility: responsibility))
    end
    new_employee.password = "12345678" # inutilizado
    new_employee.encrypted_password = old_employee.encrypted_password
    old_employee.phone_numbers.each { |p| new_employee.phone_numbers << PhoneNumber.new(p.attributes.except(:id)) }

    new_employee
  end
end
