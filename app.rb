require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
require('./lib/Definition')
also_reload('lib/**/*.rb')