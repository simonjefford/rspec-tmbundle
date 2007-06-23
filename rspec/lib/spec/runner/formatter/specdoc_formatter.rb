module Spec
  module Runner
    module Formatter
      class SpecdocFormatter < BaseTextFormatter      
        def add_behaviour(name)
          @output.puts
          @output.puts name
          @output.flush
        end
      
        def example_failed(name, counter, failure)
          @output.puts failure.expectation_not_met? ? red("- #{name} (FAILED - #{counter})") : magenta("- #{name} (ERROR - #{counter})")
          @output.flush
        end
      
        def example_passed(name)
          @output.puts green("- #{name}")
          @output.flush
        end
        
        def example_pending(name, message)
          @output.puts yellow("- #{name} (PENDING: #{message})")
          @output.flush
        end
      end
    end
  end
end
