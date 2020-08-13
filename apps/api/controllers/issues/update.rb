# frozen_string_literal: true

module Api
  module Controllers
    module Issues
      class Update
        include Api::Action

        params do
          required(:id).filled(:int?)
          optional(:title).filled(:str?)
          optional(:type).filled(:str?)
          optional(:description).filled(:str?)
        end

        def call(params)
          if params.valid?
            issue = IssueRepository.new.update(params[:id], params.to_h.except(:id))
            handle_not_found_failure and return if issue.nil?

            self.body = Api::Decorators::Issue.represent(issue).to_json
          else
            handle_validation_failure(params)
          end
        end
      end
    end
  end
end
