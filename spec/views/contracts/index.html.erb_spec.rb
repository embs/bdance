require 'spec_helper'

describe "contracts/index.html.erb" do
  before do
    @pupils = 3.times.collect do
      FactoryGirl.create(:pupil_with_enrollment)
    end
    render
  end

  it 'displays contracts numbers as pupils ids' do
    @pupils.each do |pupil|
      assert_select "tr>td", text: pupil.id, count: 1
    end
  end

  it 'displays pupils names' do
    @pupils.each do |pupil|
      assert_select "tr>td", text: "#{pupil.first_name} #{pupil.last_name}", count: 1
    end
  end

  it 'displays download link' do
    assert_select "tr>td", text: "#{t('action.download')} #{t('contract.one')}", count: 3
  end
end
