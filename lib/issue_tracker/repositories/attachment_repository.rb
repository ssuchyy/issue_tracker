class AttachmentRepository < Hanami::Repository
  def initialize
    @attacher = Attachment.file_attacher
    super
  end
  
  def create_and_attach(file_hash)
    attacher.attach(Shrine.rack_file(file_hash))
    create(file_data: attacher.data.to_json)
  end

  private

  attr_reader :attacher
end
