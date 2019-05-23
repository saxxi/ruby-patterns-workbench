require 'dry/system/container'

module DiContainer
  class Container < Dry::System::Container
    configure do |config|
      config.root = ROOT.join('di_container').realpath
    end

    load_paths! 'lib'
    auto_register! 'lib'
  end
end

DiContainer::Container.finalize! if ENV['RACK_ENV'] == 'production'
