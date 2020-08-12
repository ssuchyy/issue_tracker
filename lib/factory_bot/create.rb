module FactoryBot
  module Strategy
    class Create
      attr_reader :evaluation

      def association(runner)
        runner.run
      end

      def result(evaluation)
        @evaluation = evaluation
        persisted = evaluation.create(instance)

        evaluation.notify(:after_build, instance)
        evaluation.notify(:before_create, instance)
        evaluation.notify(:after_create, persisted)
        persisted
      end

      private

      def instance
        evaluation.object
      end
    end
  end
end