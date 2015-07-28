class Submission < ActiveRecord::Base
  
  has_attached_file :attachment, default_url: "*******",
                                 storage: :s3,
                                 bucket: ENV['S3_BUCKET_NAME'],
                                 s3_credentials: { access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                                   secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] }


  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
end
