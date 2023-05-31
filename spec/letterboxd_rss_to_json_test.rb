require_relative '../lib/letterboxd_rss_to_json'
require 'pry'

RSpec.describe Letterboxd::RssToJson do
  before do
    rss_file_path = File.join(__dir__, 'fixtures', 'matilda.rss')

    @rss_to_json = Letterboxd::RssToJson.new(rss_file_path)
    result_json = @rss_to_json.process
    @result = JSON.parse(result_json, :symbolize_names => true)
  end

  it 'outputs the title' do
    expect(@result[0][:title]).to eq expected_json[0][:title]
  end

  it 'outputs the published date' do
    expect(@result[0][:published_date]).to eq expected_json[0][:published_date]
  end


  it 'outputs the url' do
    expect(@result[0][:url]).to eq expected_json[0][:url]
  end

  it 'outputs the image_url' do
    expect(@result[0][:image_url]).to eq expected_json[0][:image_url]
  end

  it 'outputs the review' do
    expect(@result[0][:review]).to eq expected_json[0][:review]
  end

  it 'outputs the watched date' do
    expect(@result[0][:watched_date]).to eq expected_json[0][:watched_date]
  end

  it 'outputs whether movie was rewatched or not' do
    expect(@result[0][:rewatch]).to eq expected_json[0][:rewatch]
  end

  it 'outputs the film year' do
    expect(@result[0][:film_year]).to eq expected_json[0][:film_year]
  end

  it 'outputs the rating' do
    expect(@result[0][:rating]).to eq expected_json[0][:rating]
  end

  private

  def expected_json
    json = [
      {
        film_year: '2022',
        image_url: "https://a.ltrbxd.com/resized/film-poster/5/9/3/2/8/2/593282-roald-dahl-s-matilda-the-musical-0-600-0-900-crop.jpg?v=d0fb13284e",
        published_date: 'Sun, 7 May 2023 11:00:10 +1200',
        rating: 4.5,
        raw_stars: '★★★★½',
        review: "Didn’t think I’d like it as much as the 1996 film. Not only did it exceed my expectations, but it just might have surpassed the original. Time will tell.",
        rewatch: false,
        title: "Roald Dahl's Matilda the Musical",
        url: 'https://letterboxd.com/liburd/film/roald-dahls-matilda-the-musical/',
        watched_date: '2023-05-06'
      }
    ].to_json

    JSON.parse(json, :symbolize_names => true)
  end
end

