require "yaml"
require "byebug"
require 'open-uri'
require 'nokogiri'
require 'byebug'
require 'yaml'
class Runner
  def initialize
    @sites = YAML.load(File.read File.dirname(__FILE__)+ '/site/manager.yml')
  end
  
  def set_links
    @sites['sites'].each do |site|
      puts site
      @target = YAML.load(File.read File.dirname(__FILE__)+ "/site/#{site}.yml")
      list_links = @target[site]
      get_link(list_links)
    end
  end
  
  def get_link(list_links)
    list_links.each do |link|
      puts link
      @doc = Nokogiri::HTML(open(link))
      detail_link = @doc.xpath(@target['detail_link'])
      byebug
    end
  end
  
  def get_url_detail
    
    
  end
  
end