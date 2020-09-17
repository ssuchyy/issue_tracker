require_relative "../uploaders/attachment_uploader"

class Attachment < Hanami::Entity
  include AttachmentUploader::Attachment[:file]
end
