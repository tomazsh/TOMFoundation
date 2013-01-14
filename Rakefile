version = `cat VERSION`.strip
output = Dir.pwd + '/Documentation'
appledoc_options = [
  "--output \"#{output}\"",
  '--project-name TOMFoundation',
  '--project-company "Tomaz Nedeljko"',
  '--company-id com.nedeljko',
  "--project-version #{version}",
  '--keep-intermediate-files',
  '--create-html',
  '--no-repeat-first-par',
  '--verbose',
  '--create-docset'
]

namespace :docs do
  desc 'Clean documentation output'
  task :clean do
    `rm -rf Documentation`
  end
  
  desc 'Generate documentation'
  task :generate => [:'docs:clean'] do
    `appledoc #{appledoc_options.join(' ')} TOMFoundation/*.h`
  end
  
  desc 'Install documentation'
  task :install => [:'docs:clean'] do
    `appledoc #{appledoc_options.join(' ')} --install-docset TOMFoundation/*.h`
  end
end