require "rails_helper"



RSpec.describe OrdersController, :type => :controller do
  describe 'GET #custsearch' do
    
    let!(:first) { create :customer, :one }
    

    it "finds custsearch" do
      get :custsearch
      expect(response).to be_success
    end
    
    it "finds user one" do
      get :custsearch, params: { searchcriteria: 'phone', criteria: '111' }
      puts first
      expect(@results).to include(:first)
    end
    
  
    
    
  end
end