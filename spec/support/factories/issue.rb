FactoryBot.define do
  factory :issue do
    initialize_with { Issue.new(**attributes) }

    title { "Configure project" }
    type  { "task" }
  end
end
