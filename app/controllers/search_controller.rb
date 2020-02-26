require 'benchmark'

class SearchController < ApplicationController
  def index
    @search_term = params[:search_term]
    @time = Benchmark.measure {
      return @results = [] unless @search_term.present?
      @results = Micropost.joins(:user).where("microposts.title LIKE :search OR microposts.title LIKE :search OR users.name LIKE :search", search: "%#{@search_term}%")
      @results_panigate = @results.page(params[:page]).per(5)
    }.real
  end
end
