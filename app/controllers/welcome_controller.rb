class WelcomeController < ApplicationController
  def homepage
    @tacos = Taco.all
  end
end
