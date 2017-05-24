require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  
let(:my_wiki) { create(:wiki) }

  login_user

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
  
  describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
      
       it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
      
      it "instantiates @wiki" do
        get :new
        expect(assigns(:wiki)).not_to be_nil
      end
  end
  
  describe "GET show" do
     it "returns http success" do
       get :show, {id: my_wiki.id}
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
       get :show, {id: my_wiki.id}
       expect(response).to render_template :show
     end
 
     it "assigns my_wiki to @wiki" do
       get :show, {id: my_wiki.id}
       expect(assigns(:wiki)).to eq(my_wiki)
     end
  end
  
  describe "POST create" do
      it "increases the number of Wiki by 1" do
        expect{post :create, wiki: {title: Faker::Commerce.product_name, body: Faker::Company.bs}}.to change(Wiki,:count).by(1)
      end

      it "assigns the new wiki to @wiki" do
        post :create, wiki: {title: Faker::Commerce.product_name, body: Faker::Company.bs}
        expect(assigns(:wiki)).to eq Wiki.last
      end
 
      it "redirects to the new wiki" do
        post :create, wiki: {title: Faker::Commerce.product_name, body: Faker::Company.bs}
        expect(response).to redirect_to Wiki.last
      end
  end
  
  describe "DELETE destroy" do
      it "deletes the wiki" do
        delete :destroy,  id: my_wiki.id
        count = Wiki.where({id: my_wiki.id}).size
        expect(count).to eq 0
      end
    end
end
