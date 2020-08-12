# frozen_string_literal: true

module Api
  module Controllers
    module Issues
      class Create
        include Api::Action

        params do
          required(:title).filled(:str?)
          required(:type).filled(:str?)
          optional(:description).filled(:str?)
        end

        def call(params)
          if params.valid?
            issue = IssueRepository.new.create(params)
            self.body = Api::Decorators::Issue.represent(issue).to_json
          else
            handle_validation_failure(params)
          end
        end
      end
    end
  end
end
