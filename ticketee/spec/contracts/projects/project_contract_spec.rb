require 'rails_helper'

RSpec.describe Projects::ProjectContract do
  let(:result) { subject.call(attributes) }

  context "when name is specified" do
    let(:attributes) { { name: "Test Project" } }

    it "is valid" do
      expect(result).to be_success
    end

    context "when name is not specified" do
      let(:attributes) { {} }

      it "is invalid" do
        expect(result).to be_failure
        expect(result.errors[:name]).to eq(["is missing"])
      end
    end
  end
end