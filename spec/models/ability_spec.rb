require 'spec_helper'
require 'cancan/matchers'

describe 'Ability' do
  let(:user) { FactoryGirl.create(:user) }
  let(:pupil) { FactoryGirl.create(:pupil) }
  let(:teacher) { FactoryGirl.create(:teacher) }
  let(:manager) { FactoryGirl.create(:manager) }

  context 'when user not authenticated' do
    subject { Ability.new(nil) }

    it 'can see groups' do
      subject.should be_able_to(:read, Group)
    end

    it 'can see modalities' do
      subject.should be_able_to(:read, Modality)
    end

    it 'can see rhythms' do
      subject.should be_able_to(:read, Rhythm)
    end

    it 'can see events' do
      subject.should be_able_to(:read, Rhythm)
    end

    it 'cant see employees' do
      subject.should_not be_able_to(:read, Employee)
    end

    it 'cant see pupils' do
      subject.should_not be_able_to(:read, Pupil)
    end

    it 'cant see enrollments' do
      subject.should_not be_able_to(:read, Enrollment)
    end

    it 'cant see hours packages' do
      subject.should_not be_able_to(:read, HoursPackage)
    end

    it 'cant see presences' do
      subject.should_not be_able_to(:read, Presence)
    end

    it 'can manage nothing' do
      subject.should_not be_able_to(:manage, :all)
    end
  end

  context 'when user authenticated' do
    subject { Ability.new(user) }

    it 'can manage himself' do
      subject.should be_able_to(:manage, user)
    end

    it 'can see their presences' do
      presence = FactoryGirl.create(:presence, user: user)
      subject.should be_able_to(:read, presence)
    end

    it 'cant see other user presences' do
      presence = FactoryGirl.create(:presence)
      subject.should_not be_able_to(:read, presence)
    end

    it 'cant manage their presences' do
      subject.should_not be_able_to(:manage, user.presences)
    end

    context 'as pupil' do
      subject { Ability.new(pupil) }

      it 'can see other pupils' do
        subject.should be_able_to(:read, Pupil)
      end

      it 'cant manage pupils' do
        subject.should_not be_able_to(:manage, Pupil)
      end
    end

    context 'as teacher' do
      subject { Ability.new(teacher) }

      it 'can see their presences' do
        presence = FactoryGirl.create(:presence, user: teacher.user)
        subject.should be_able_to(:read, presence)
      end

      it 'can see pupils presences' do
        presence = FactoryGirl.create(:presence, user: pupil.user)
        subject.should be_able_to(:read, presence)
      end

      it 'cant see employees presences' do
        presence = FactoryGirl.create(:presence, user: manager.user)
        subject.should_not be_able_to(:read, presence)
      end

      it 'can manage pupils presences' do
        presence = FactoryGirl.create(:presence, user: pupil.user)
        subject.should be_able_to(:manage, presence)
      end

      it 'cant manage their presences' do
        presence = FactoryGirl.create(:presence, user: teacher.user)
        subject.should_not be_able_to(:manage, presence)
      end

      it 'cant manage employees presences' do
        presence = FactoryGirl.create(:presence, user: manager.user)
        subject.should_not be_able_to(:manage, presence)
      end
    end

    context 'as manager' do
      subject { Ability.new(manager) }

      it 'can see everything' do
        subject.should be_able_to(:read, :all)
      end

      it 'can manage everything' do
        subject.should be_able_to(:manage, :all)
      end
    end
  end
end
