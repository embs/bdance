require 'spec_helper'

describe "welcome/index.html.erb" do
  before do
    render
  end

  it "displays welcome message" do
    assert_select "h1", text: t('message.welcome'), count: 1
  end

  it "displays info boxes titles" do
    assert_select "h3", text: t('message.habilities.manage.title'), count: 1
    assert_select "h3", text: t('message.habilities.control.title'), count: 1
    assert_select "h3", text: t('message.habilities.explore.title'), count: 1
  end

  it "displays info boxes bodies" do
    assert_select "p", text: t('message.habilities.manage.body'), count: 1
    assert_select "p", text: t('message.habilities.control.body'), count: 1
    assert_select "p", text: t('message.habilities.explore.body'), count: 1
  end

  it "displays know_more links" do
    assert_select "a", text: t('message.habilities.know_more'), count: 3
  end
end
