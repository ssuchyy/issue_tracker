# frozen_string_literal: true

RSpec.describe Api::Controllers::Issues::Index, type: :action do
  let(:action) { described_class.new }

    let(:params) { Hash[] }

    context "when some issues exists" do
      before { create_list(:issue, 3) }
      it "returns array of issues" do
        response = action.call(params)
        parsed_response = parsed_body(response)
        
        expect(parsed_response.count).to eq(3)
        expect(parsed_response[0]).to include(:id, :title, :description, :type)
      end
    end

    context "when there are no issues" do
      it "returns empty array" do
        response = action.call(params)
        expect(parsed_body(response)).to eq([])
      end
    end
end
