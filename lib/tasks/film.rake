Dir[File.expand_path(File.dirname(__FILE__)) + '/../crawler/*.rb'].each {|file|require file}
namespace :film do
  desc "Get film info"
  task crawl: :environment do |args|
    Runner.new.set_links
  end

end
