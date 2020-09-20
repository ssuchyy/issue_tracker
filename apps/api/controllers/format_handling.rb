# frozen_string_literal: true

module Api
  module FormatHandling
    def self.included(action)
      action.class_eval do
        before :force_json
      end
    end

    private

    def force_json
      self.format = :json
    end
  end
end
