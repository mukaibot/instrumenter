module Instrumenter
  class InstrumenterMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      Instrumenter.setup(env)
      begin
        @app.call(env)
      ensure
        Instrumenter.clear
      end
    end
  end
end
