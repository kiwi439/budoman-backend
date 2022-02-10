module Types
  class MutationType < Types::BaseObject
    field :update_book, mutation: Mutations::UpdateBook, description: 'Updates book and returns it'
    field :update_author, mutation: Mutations::UpdateAuthor, description: 'Updates author and returns it'
  end
end