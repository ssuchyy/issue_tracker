module Api
  module Controllers
    module Issues
      class Show
        include Api::Action

        def call(params)
          self.body = { id: SecureRandom.uuid }.to_json
        end
      end
    end
  end
end
