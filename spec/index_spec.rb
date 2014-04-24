require_relative 'spec_helper'

describe "the index controller" do

  it "home page should redirect to login without a current session" do
    get '/'
    expect(last_response.location).to include 'login_or_signup'
  end

  it "home page should redirect to account page given a current session" do
    session = { id: 4}
    get '/', {}, { 'rack.session' => session }
    expect(last_response.location).to include 'account_page'
  end

  # it "the login or signup path should render the login or signup erb template" do
  #   get '/login_or_signup'
  #   p last_response
  #   expect(last_response).to be(200)
  # end

end



  # it "should reverse posted values as well" do
  #   post '/', params = { :str => 'Jeff' }
  #   last_response.body.should == 'ffeJ'
  # end



