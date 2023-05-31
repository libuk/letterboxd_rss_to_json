require_relative '../lib/letterboxd_rss_to_json'

RSpec.describe Letterboxd::RssToJson do
  before do
    rss_file_path = File.join(__dir__, 'fixtures', 'matilda.rss')

    @rss_to_json = Letterboxd::RssToJson.new(rss_file_path)
    result_json = @rss_to_json.process
    @result = JSON.parse(result_json, :symbolize_names => true)
  end

  it 'outputs the title' do
    expect(@result[0][:title]).to eq "Roald Dahl's Matilda the Musical"
  end

  it 'outputs the published date' do
    expect(@result[0][:published_date]).to eq 'Sun, 7 May 2023 11:00:10 +1200'
  end

  it 'outputs the url' do
    expect(@result[0][:url]).to eq 'https://letterboxd.com/liburd/film/roald-dahls-matilda-the-musical/'
  end

  it 'outputs the image_url' do
    expect(@result[0][:image_url]).to eq 'https://a.ltrbxd.com/resized/film-poster/5/9/3/2/8/2/593282-roald-dahl-s-matilda-the-musical-0-600-0-900-crop.jpg?v=d0fb13284e'
  end

  it 'outputs the review' do
    expect(@result[0][:review]).to eq "Didn’t think I’d like it as much as the 1996 film. Not only did it exceed my expectations, but it just might have surpassed the original. Time will tell."
  end

  it 'outputs the watched date' do
    expect(@result[0][:watched_date]).to eq '2023-05-06'
  end

  it 'outputs whether movie was rewatched or not' do
    expect(@result[0][:rewatch]).to eq false
  end

  it 'outputs the film year' do
    expect(@result[0][:film_year]).to eq '2022'
  end

  it 'outputs the rating' do
    expect(@result[0][:rating]).to eq 4.5
  end

  it 'outputs the raw stars' do
    expect(@result[0][:raw_stars]).to eq '★★★★½'
  end
end

