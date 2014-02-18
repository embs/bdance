require 'spec_helper'

describe Enrollment do
  it { should belong_to(:pupil) }
  it { should belong_to(:group) }

  describe :update_monthly_fees do
    let(:pupil) { FactoryGirl.create(:pupil) }
    let(:group) { FactoryGirl.create(:group) }

    before do
      pupil.groups << group
    end

    it 'creates monthly fees for first enrollment' do
      pupil.monthly_fees.should_not be_empty
    end

    it 'updates monthly fees for new enrollments' do
      pupil.groups << FactoryGirl.create(:group)
      pupil.monthly_fees.each do |monthly_fee|
        monthly_fee.amount.should eq(group.price*2)
      end
    end
  end
end
