# frozen_string_literal: true

class AttachmentRepository < Hanami::Repository
  def initialize
    @attacher = Attachment.file_attacher
    super
  end

  def create_and_attach(issue_id:, file_hash:)
    attacher.attach(Shrine.rack_file(file_hash))
    create(issue_id: issue_id, file_data: attacher.data.to_json)
  end

  private

  attr_reader :attacher
end
