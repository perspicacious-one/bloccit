require 'rails_helper'

RSpec.describe Answer, type: :model do
    let(:question) { Question.create!(title: "New Question Title", body: "New body text", resolved: false) }
    let(:answer) { Answer.create!(body: "New answer text", Question: question) }

    describe "attributes" do
      it "has body attribute" do
        expect(answer).to have_attributes(body: "New answer text", Question: question)
      end
    end
end
