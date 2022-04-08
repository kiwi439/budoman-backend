# frozen_string_literal: true

module Types
  module Custom
    module User
      module Inputs
        class AvatarInputType < Types::BaseInputObject
          argument :main, Boolean
          argument :base64, String
          argument :file_name, String
        end
      end
    end
  end
end