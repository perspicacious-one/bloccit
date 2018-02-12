require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }

  let(:my_post) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_int) }

  describe "GET new" do
    it "returns http success" do
      get :new, params: { topic_id: my_topic.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, params: { topic_id: my_topic.id }
      expect(response).to render_template :new
    end

    it "instantiates @post" do
      get :new, params: { topic_id: my_topic.id }
      expect(assigns(:sponsored_post)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of SponsoredPost by 1" do
      expect{ post :create, params: { topic_id: my_topic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: new_price } } }.to change(SponsoredPost, :count).by(1)
    end

    it "assigns the new post to @sponsored_post" do
      post :create, params: { topic_id: my_topic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: new_price } }
      expect(assigns(:sponsored_post)).to eq SponsoredPost.last
    end

    it "redirects to the new sponsored post" do
      post :create, params: { topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: new_price } }
       expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: { topic_id: my_topic.id, id: my_post.id }
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, params: { topic_id: my_topic.id, id: my_post.id }
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, params: { topic_id: my_topic.id, id: my_post.id }
      expect(assigns(:sponsored_post)).to eq(my_post)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params: { topic_id: my_topic.id, id: my_post.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, params: { topic_id: my_topic.id, id: my_post.id }
      # #1
      expect(response).to render_template :edit
    end

    # #2
    it "assigns post to be updated to @post" do
      get :edit, params: { topic_id: my_topic.id, id: my_post.id }

      post_instance = assigns(:sponsored_post)

      expect(post_instance.id).to eq my_post.id
      expect(post_instance.title).to eq my_post.title
      expect(post_instance.body).to eq my_post.body
    end
  end

  describe "PUT update" do
    it "updates post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = RandomData.random_int

      put :update, params: { topic_id: my_topic.id, id: my_post.id, sponsored_post: {title: new_title, body: new_body, price: new_price } }

      updated_post = assigns(:sponsored_post)
      expect(updated_post.id).to eq my_post.id
      expect(updated_post.title).to eq new_title
      expect(updated_post.body).to eq new_body
    end

    it "redirects to the updated post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = RandomData.random_int

      put :update, params: { topic_id: my_topic.id, id: my_post.id, sponsored_post: {title: new_title, body: new_body, price: new_price } }
       expect(response).to redirect_to [my_topic, my_post]
    end
  end

  describe "DELETE destroy" do
    it "deletes the post" do
      delete :destroy, params: { topic_id: my_topic.id, id: my_post.id }
      # #6
      count = SponsoredPost.where({id: my_post.id}).size
      expect(count).to eq 0
    end

    it "redirects to topic show" do
      delete :destroy, params: { topic_id: my_topic.id, id: my_post.id }
      expect(response).to redirect_to my_topic
    end
  end

end
