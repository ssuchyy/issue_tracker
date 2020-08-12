# frozen_string_literal: true

RSpec.describe Api::Controllers::Issues::Create, type: :action do
  let(:action) { described_class.new }

  context "when params are valid" do
    let(:params) { Hash[title: "Configure application", type: "task", description: "Just do it"] }

    it "is successful" do
      response = action.call(params)
      expect(response[0]).to eq 200
    end

    it "creates new issue from params" do
      expect {action.call(params)}.to change{ IssueRepository.new.all.count }.by(1)
    end

    it "returns newly created issue as response" do
      response = action.call(params)
      expect(parsed_body(response)).to include(id: instance_of(Integer), title: "Configure application", type: "task", description: "Just do it")
    end
  end

  context "when params are invalid" do
    let(:params) { Hash[description: ""] }

    it "returns bad request response code" do
      response = action.call(params)
      expect(response[0]).to eq 400
    end

    it "returns all errors in response" do
      response = action.call(params)
      expect(parsed_body(response)[:errors]).to include(title: ["is missing"],
                                                        type: ["is missing"],
                                                        description: ["must be filled"])
    end
  end
end
