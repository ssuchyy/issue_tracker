# frozen_string_literal: true

class IssueRepository < Hanami::Repository
  associations do
    has_many :attachments
  end

  def find_with_attachments(id)
    aggregate(:attachments).where(id: id).as(Issue).one
  end

  def all_with_attachments
    aggregate(:attachments).as(Issue).to_a
  end
end
