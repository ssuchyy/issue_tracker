# frozen_string_literal: true

RSpec.describe Api::Controllers::Issues::Destroy, type: :action do
  let(:action) { described_class.new }

  context "when params are valid" do
    let(:params) { Hash[id: issue_id] }

    context "when issue with given id exists" do
      let(:issue_id) { issue.id }
      let(:issue) { create(:issue) }

      it "is successful" do
        response = action.call(params)
        expect(response[0]).to eq 204
      end

      it "deletes issue with given id" do
        expect { action.call(params).to change { IssueRepository.new.find(issue.id) }.to(nil) }
      end
    end

    context "when issue with given id does not exist" do
      let(:issue_id) { 999999999999999 }

      it "returns not found status code" do
        response = action.call(params)
        expect(response[0]).to eq 404
      end

      it "returns appropriate error in response" do
        response = action.call(params)
        expect(parsed_body(response)[:errors]).to include(base: ["Could not find object with given id"])
      end
    end
  end

  context "when params are invalid" do
    let(:params) { Hash[] }

    it "returns bad request response code" do
      response = action.call(params)
      expect(response[0]).to eq 400
    end

    it "returns all errors in response" do
      response = action.call(params)
      expect(parsed_body(response)[:errors]).to include(id: ["is missing"])
    end
  end
end
