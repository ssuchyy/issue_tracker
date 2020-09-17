require "shrine/storage/memory"

RSpec.describe AttachmentRepository, type: :repository do
  let(:repo) { described_class.new }
  let(:file_hash) do
    { 
      :name => "file_to_upload.txt", 
      :filename => "file_to_upload.txt", 
      :type => "text/plain", 
      :tempfile => Rack::Test::UploadedFile.new("spec/support/fixtures/file_to_upload.txt", "text/plain"), 
      :head => "", 
    } 
  end


  before do
    AttachmentUploader.storages = {
      cache: Shrine::Storage::Memory.new,
      store: Shrine::Storage::Memory.new,
    }
  end
  
  describe "#create_and_attach" do
    subject { repo.create_and_attach(file_hash) }

    it "creates attachment" do
      expect { subject }.to change { repo.all.count }.by(1)
    end

    it "returns created attachment with metadata populated" do
      attachment = subject
      expect(attachment).to be_instance_of(Attachment)
      expect(attachment.id).to_not be(nil)

      data = JSON.parse(attachment.file_data)
      expect(data).to include("id", "storage", "metadata")

      metadata = data["metadata"]
      expect(metadata).to include("filename", "size", "mime_type")
    end
  end
end
