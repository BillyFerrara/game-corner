ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :env do
  require_relative './config/environment'
end

task :console => :env do
  Pry.start
end 
