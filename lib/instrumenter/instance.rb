module Instrumenter
  class Instance
    attr_reader :logger, :request_id

    def initialize(request_id)
      @request_id = request_id
    end

    def log_event(message)
      event = {request_id: request_id, message: message}.to_json
      Rails.logger.info event
    end
  end
end
