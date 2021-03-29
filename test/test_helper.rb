ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def select_date_and_time(date, from:)
    return nil unless date
    select date.strftime("%Y"), from: "#{from}_1i"
    select date.strftime("%B"), from: "#{from}_2i"
    select date.strftime("%-d"), from: "#{from}_3i"
    select date.strftime("%H"), from: "#{from}_4i"
    select date.strftime("%M"), from: "#{from}_5i"
  end
end
