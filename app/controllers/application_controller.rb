class ApplicationController < ActionController::Base
  include DisplayCase::ExhibitsHelper

  protect_from_forgery

  private

  def exhibit_exposed(*names)
    names.each do |name|
      _resources[name] = exhibit(self.send(name))
    end
  end
end
