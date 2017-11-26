require "instrumenter/instance"
require "instrumenter/version"
require "securerandom"

module Instrumenter
  THREAD_VARIABLE_NAME = 'instrumenter'.freeze

  class << self

    def setup(env)
      request_id = env.fetch("HTTP_X_REQUEST_ID", SecureRandom.uuid)
      instrumenter = Instrumenter::Instance.new(request_id)
      Thread.current[THREAD_VARIABLE_NAME] = instrumenter
      instrumenter
    end

    def instance
      Thread.current[THREAD_VARIABLE_NAME] ||= Instrumenter::Instance.new(SecureRandom.uuid)
    end

    def clear
      Thread.current[THREAD_VARIABLE_NAME] = nil
    end
  end
end
