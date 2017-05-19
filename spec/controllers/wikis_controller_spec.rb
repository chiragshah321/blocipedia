require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  
let(:my_wiki) { Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }  

  describe "GET #index" do
    
    it "returns http success" do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
