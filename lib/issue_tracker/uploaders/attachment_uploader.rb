require_relative "../../../config/initializers/shrine"

class AttachmentUploader < Shrine
  plugin :entity
end