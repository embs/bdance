class Enrollment < ActiveRecord::Base
  after_save :update_monthly_fees

  belongs_to :pupil
  belongs_to :group

  private
    def update_monthly_fees
      if pupil.monthly_fees.empty?
        due_date = Time.now + 1.month
        while due_date < group.end_date
          MonthlyFee.create(amount: group.price, due_date: due_date, pupil: pupil)
          due_date = due_date + 1.month
        end
      else
        monthly_fees = pupil.monthly_fees.where('due_date > ?', Time.now)
        monthly_fees.each do |monthly_fee|
          monthly_fee.update_attribute(:amount, monthly_fee.amount + group.price)
        end
      end
    end
end
