# frozen_string_literal: true

module Mutations
  class RemoveUserMutation < GraphQL::Schema::Mutation
    argument :user_id, ID, required: true
    type Types::Custom::Objects::UserObject

    def resolve(params)
      ::Users::HandleRemoveUserService.call(user_id: params.fetch(:user_id), session: context.fetch(:session))
    end
  end
end
