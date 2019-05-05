require "google/cloud/storage"

project_id = ENV['PROJECT_ID']
bucket_name = ENV['BUCKET_NAME']
local_file_path = ENV['BACKUP_PATH'] || '/usr/src/backup'
description = ENV['DESCRIPTION'] || 'generic-backup'
timestamp = Time.now.strftime '%Y%m%d%H%M%S'
storage_file_path = '%{description}-%{timestamp}' % { description: description, timestamp: timestamp }


storage = Google::Cloud::Storage.new project: project_id

# Make an authenticated API request
storage.buckets.each do |bucket|
  puts bucket.name
end

#storage = Google::Cloud::Storage.new project_id: project_id
#bucket  = storage.bucket bucket_name

#file = bucket.create_file local_file_path, storage_file_path

#puts "Uploaded #{file.name}"
