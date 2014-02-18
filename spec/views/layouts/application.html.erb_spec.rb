require 'spec_helper'

describe "layouts/application" do
  include Devise::TestHelpers

  before do
    render
  end

  it "displays link to app root" do
    assert_select "a", text: "BDance", count: 1
  end

  it "displays login options" do
    assert_select "ul>li>a", text: t('action.signup'), count: 1
    assert_select "ul>li>a", text: t('action.signin'), count: 1
    assert_select "ul>li>a", text: t('action.fb_login'), count: 1
  end

  it "displays side menu sections" do
    assert_select "ul>li", text: t('navigation.people'), count: 1
    assert_select "ul>li", text: t('navigation.dancing'), count: 1
    assert_select "ul>li", text: t('navigation.enrollments_n_presences'), count: 1
  end

  it "displays side menu options" do
    assert_select "ul>li>a", text: Pupil.model_name.human.pluralize, count: 1
    assert_select "ul>li>a", text: Employee.model_name.human.pluralize, count: 1
    assert_select "ul>li>a", text: Group.model_name.human.pluralize, count: 1
    assert_select "ul>li>a", text: Modality.model_name.human.pluralize, count: 1
    assert_select "ul>li>a", text: Rhythm.model_name.human.pluralize, count: 1
    assert_select "ul>li>a", text: Enrollment.model_name.human.pluralize, count: 1
    assert_select "ul>li>a", text: HoursPackage.model_name.human.pluralize, count: 1
    assert_select "ul>li>a", text: Presence.model_name.human.pluralize, count: 1
    assert_select "ul>li>a", text: t('contract.many'), count: 1
    assert_select "ul>li>a", text: MonthlyFee.model_name.human.pluralize, count: 1
  end
end
