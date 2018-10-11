RSpec::Support.require_rspec_core "formatters/base_text_formatter"
RSpec::Support.require_rspec_core "formatters/console_codes"

class CustomFormatter < RSpec::Core::Formatters::DocumentationFormatter
  RSpec::Core::Formatters.register self, :example_group_started, :example_group_finished,
                      :example_passed, :example_pending, :example_failed

  def dump_pending(notification); end

  def dump_failures(notification); end

end
