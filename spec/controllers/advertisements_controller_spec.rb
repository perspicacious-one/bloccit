require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  let(:advert) { Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_int) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns [advert] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([advert])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: advert.id }
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      # #17
      get :show, params: { id: advert.id }
      expect(response).to render_template :show
    end

    it "assigns my_post to @advertisement" do
      get :show, params: { id: advert.id }
      # #18
      expect(assigns(:advertisement)).to eq(advert)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "redirects to the new ad" do
      post :create, params: { advertisement: { title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_int } }
      expect(response).to redirect_to Advertisement.last
    end
  end

  describe "POST create" do
    it "increases the number of Advertisements by 1" do
      expect{ Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_int) }.to change(Advertisement,:count).by(1)
    end
  end

end
