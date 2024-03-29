module Newsletters
  class SubscribeToNewsletterService < BaseService
    def initialize(params:)
      super()
      @params = params
    end

    def call
      subscribe_to_newsletter
    end

    private

    def subscribe_to_newsletter
      Newsletter.create!(@params)
    end
  end
end
