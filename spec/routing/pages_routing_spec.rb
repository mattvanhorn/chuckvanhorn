require 'spec_helper'

describe "page routing" do
  it "routes the home page" do
    { :get => "/" }.
      should route_to(
        :controller => "pages",
        :action => "home"
      )
  end

end
