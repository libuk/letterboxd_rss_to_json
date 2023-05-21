Gem::Specification.new do |s|
  s.name        = 'letterboxd_rss_to_json'
  s.version     = '0.1.0'
  s.summary     = "Converts a letterboxd rss feed into JSON objects."
  s.authors     = ["Dan Liburd"]
  s.files       = Dir['lib/**/*.rb']
  s.executables = 'letterboxd_rss_to_json'

  s.add_runtime_dependency 'rss', '~> 0.2.9'

  s.add_development_dependency 'pry', '~> 0.14.2'
  s.add_development_dependency 'rspec', '~> 3.12'
end
