module Users
  class BuildAvatarPayloadService
    extend Utils::CallableObject

    def initialize(user_id:, avatar:)
      @user_id = user_id
      @avatar = avatar
      @config = Rails.application.config
    end

    def call
      avatar_base64 = generate_avatar_base64
      path_to_file = generate_path_to_file
      avatar_details = generate_avatar_details(path_to_file: path_to_file)

      {
        base64: avatar_base64,
        path: path_to_file,
        bucket: @config.aws_bucket,
        details: avatar_details
      }
    end

    private

    def generate_avatar_base64
      Base64.decode64(@avatar.fetch(:base64).split(',').second)
    end

    def generate_path_to_file
      "users/#{@user_id}/avatars/#{@avatar.fetch(:file_name)}"
    end

    def generate_avatar_details(path_to_file:)
      storage_path = "https://#{@config.aws_bucket}.#{@config.aws_path}/#{path_to_file}"

      { main: @avatar.fetch(:main), storage_path: storage_path }
    end
  end
end