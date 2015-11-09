require 'vcr'

VCR.configure do |c|
  c.cassete_library_dir = Rails.root.join("spec", "vcr_cassettes")
  c.stub_with :webmock
  c.default_cassette_options = { :record => :once }
end
