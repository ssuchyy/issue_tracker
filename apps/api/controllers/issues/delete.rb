# frozen_string_literal: true

module Api
  module Controllers
    module Issues
      class Delete
        include Api::Action

        params do
          required(:id).filled(:int?)
        end

        def call(params)
          if params.valid?
            issue = IssueRepository.new.delete(params[:id])
            handle_not_found_failure and return if issue.nil?

            self.status = 204
          else
            handle_validation_failure(params)
          end
        end
      end
    end
  end
end
