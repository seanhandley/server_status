require 'spec_helper'

describe HomeController do
  context '#index' do
    it 'should load successfully' do
      get :index
      response.should be_success
    end
  end
end