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

  it "the login or signup path should render the login or signup erb template" do
    get '/login_or_signup'
    expect(last_response.status).to be(200)
  end

  it "the login route should successfully render the login erb template" do
    get '/login'
    expect(last_response.status).to be(200)
  end

  it "the signup route should successfully render the signup erb template" do
    get '/signup'
    expect(last_response.status).to be(200)
  end

  # it "posting within the signup page should redirect to the user's account page" do
  #   post '/signup', # params = { :username => "dude", :password => "pwd"}
  #   p last_response
  #   # expect(last_response.location).to include 'account'
  # end

end



  # it "should reverse posted values as well" do
  #   post '/', params = { :str => 'Jeff' }
  #   last_response.body.should == 'ffeJ'
  # end



