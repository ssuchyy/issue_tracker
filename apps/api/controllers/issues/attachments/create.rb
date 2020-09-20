# frozen_string_literal: true

module Api
  module Controllers
    module Issues
      module Attachments
        class Create
          include Api::Action

          params do
            required(:issue_id).filled(:int?)
            required(:file).filled
          end

          def call(params)
            AttachmentRepository.new.create_and_attach(params[:file])
            self.status = 200
          end
        end
      end
    end
  end
end
