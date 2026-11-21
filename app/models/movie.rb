class Movie < ApplicationRecord
  def self.all_ratings
    %w[G PG PG-13 R]
  end

  def self.with_ratings(ratings, sort_by)
    if ratings.nil?
      all.order sort_by
    else
      where(rating: ratings.map(&:upcase)).order sort_by
    end
  end

  def self.find_in_tmdb(tmdb_args)
    url = "https://api.themoviedb.org/3/search/movie"
    response = Faraday.get(
      url,
      {
        query: tmdb_args[:title],
        year: tmdb_args[:release_year],
        language: tmdb_args[:language],
        api_key: ENV["TMDB_API_KEY"],
      },
    )

    data = JSON.parse(response.body)
    return data["results"]
  end

  def self.find_in_tmdb_2(str)
    Faraday.get(str)
  end
end
