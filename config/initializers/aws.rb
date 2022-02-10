require 'aws-sdk-core'

Aws.config.update(
  region: 'us-west-2',
  credentials: Aws::Credentials.new(
    Rails.application.credentials.dig(:aws, :access_key_id)
    Rails.application.credentials.dig(:aws, :secret_access_key)
  )
)
