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
    assert_select "ul>li>a[href=#{pupils_path}]", text: Pupil.model_name.human.pluralize, count: 1
    assert_select "ul>li>a[href=#{employees_path}]", text: Employee.model_name.human.pluralize, count: 1
    assert_select "ul>li>a[href=#{groups_path}]", text: Group.model_name.human.pluralize, count: 1
    assert_select "ul>li>a[href=#{modalities_path}]", text: Modality.model_name.human.pluralize, count: 1
    assert_select "ul>li>a[href=#{rhythms_path}]", text: Rhythm.model_name.human.pluralize, count: 1
    assert_select "ul>li>a[href=#{enrollments_path}]", text: Enrollment.model_name.human.pluralize, count: 1
    assert_select "ul>li>a[href=#{hours_packages_path}]", text: HoursPackage.model_name.human.pluralize, count: 1
    assert_select "ul>li>a[href=#{presences_path}]", text: Presence.model_name.human.pluralize, count: 1
    assert_select "ul>li>a[href=#{contracts_path}]", text: t('contract.many'), count: 1
    assert_select "ul>li>a[href=#{monthly_fees_path}]", text: MonthlyFee.model_name.human.pluralize, count: 1
  end
end
