module Api
  module Validation
    def handle_validation_failure(params)
      self.status = 400
      self.body = params.errors.to_json
    end
  end
end