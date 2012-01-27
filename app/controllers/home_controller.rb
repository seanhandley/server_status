class HomeController < ApplicationController
  def index
    render text: 'OK'
  end

  def lol
	render text: 'haha lol'
  end
end