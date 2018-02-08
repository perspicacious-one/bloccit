require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advert) { Advertisement.create!(title: "New Ad Title", copy: "New Ad Copy", price: 100) }

  describe "attributes" do
    it "has title, copy, price attributes" do
      expect(advert).to have_attributes(title: "New Ad Title", copy: "New Ad Copy", price: 100)
    end
  end
end
