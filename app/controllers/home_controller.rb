class HomeController < ApplicationController
  def index
    @random = Veneration.order("RANDOM()").limit(10)
    @recent = Veneration.order(created_at: :DESC).limit(10)
    @counts = Veneration.scores.inject({}) { |s, k| s.update k[0] => Veneration.where(score: k[1]).count }
  end
end
