module Crono
  class Engine < ::Rails::Engine
    isolate_namespace Crono

    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end
  end
end
