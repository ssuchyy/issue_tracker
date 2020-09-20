# frozen_string_literal: true

module Api
  module Controllers
    module Issues
      class Index
        include Api::Action

        def call(_params)
          issues = IssueRepository.new.all
          self.body = Api::Decorators::Issue.represent(issues).to_json
        end
      end
    end
  end
end
