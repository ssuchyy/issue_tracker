module Api
  module FailureHandling
    def handle_validation_failure(params)
      self.status = 400
      self.body = { errors: params.errors }.to_json
    end

    def handle_not_found_failure
      self.status = 404
      self.body = { errors: { base: ["Could not find object with given id"] } }.to_json
    end
  end
end