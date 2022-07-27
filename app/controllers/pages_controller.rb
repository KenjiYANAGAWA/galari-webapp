class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @exhibits = %w(a i u e o)
  end
end
