# frozen_string_literal: true

module Api
  module Decorators
    class Issue < Grape::Entity
      expose :id
      expose :title
      expose :description
      expose :type
    end
  end
end
