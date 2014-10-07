# TODO where to write?
require 'jquery-rails'
require 'slim-rails'

module Adhoq
  class Engine < ::Rails::Engine
    isolate_namespace Adhoq

    config.generators do |g|
      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_girl, dir:     'spec/factories'
    end

    initializer 'adhoq' do
      config.storage = [:local_file, Rails.root + "/tmp/adhoq/#{Rails.env}"]
    end
  end
end
