module Api
  module Controllers
    module Issues
      class Index
        include Api::Action

        def call(params)
          issues = IssueRepository.new.all
          self.body = Api::Decorators::Issue.represent(issues).to_json
        end
      end
    end
  end
end
