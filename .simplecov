SimpleCov.start 'rails' do
  SimpleCov.minimum_coverage 95
  add_filter "app/channels"
  add_filter "app/jobs"
  add_filter "app/mailers"
  add_filter "app/models/application_record.rb"
end