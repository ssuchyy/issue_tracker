require "shrine"
require 'shrine/storage/file_system'
require "shrine/storage/s3"
 
Shrine.storages = { 
  cache: Shrine::Storage::FileSystem.new(Dir.tmpdir),
  store: Shrine::Storage::S3.new(
    bucket: ENV['S3_BUCKET_NAME'],
    region: ENV['AWS_REGION'],
    access_key_id: ENV['AWS_S3_UPLOADER_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_S3_UPLOADER_SECRET_ACCESS_KEY'],
  )
}

Shrine.plugin :rack_file