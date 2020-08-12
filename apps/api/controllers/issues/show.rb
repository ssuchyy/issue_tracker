module Api
  module Controllers
    module Issues
      class Show
        include Api::Action

        params do
          required(:id).filled(:int?)
        end

        def call(params)
          if params.valid?
            issue = IssueRepository.new.find(params[:id])
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
