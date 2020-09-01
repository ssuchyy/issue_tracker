# frozen_string_literal: true

module ApiHelper
  def parsed_body(response)
    JSON.parse(response[2][0], symbolize_names: true)
  end
end
