
require "rails_helper"

describe "tries logins", :type => :feature do
  
  before(:each) do
    @role1 = FactoryGirl.create :role, :admin
    @u1 = FactoryGirl.create :user, :admin, id: "1", username: "admin", password: "admin123", Name: "admin"
    @cap1 = FactoryGirl.create :cap, :all
  end
  
  it 'logs in admin' do
    visit '/login'
    expect(page).to have_content('Log in')
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
    sign_in_with('admin', 'admin123')
    expect(page).to have_content('admin')
    expect(page).to have_content('Dashboard')

  end
  
  it 'logs in a user' do 
    #TODO WRITE ME
  end
  
  it 'logs out' do 
    #TODO WRITE ME
  end
  
  def sign_in_with(username, password)
    fill_in 'session_username', with: username
    fill_in 'session_password', with: password
    click_button 'Log in'
  end

end