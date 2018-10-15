require 'spec_helper'

describe 'Factories' do
  include Helpers

  exclude = []

  Dir.glob('app/models/**/*.rb').each do |filename|
    filename = filename.sub(/^app\/models\//, '').sub(/\.rb$/, '')
    model = filename.camelize.constantize
    factory = filename.gsub(/\//, '_')
    if model.class != Module && !exclude.include?(factory)
      exclude << factory
      it "can't create an object with factory :#{factory}" do
        can_create_an_object? factory
      end
    end
  end
end
