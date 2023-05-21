require_relative '../lib/letterboxd_rss_to_json'

RSpec.describe Letterboxd::RssToJson do
  before do
    rss_file_path = File.join(__dir__, 'fixtures', 'matilda.rss')

    @rss_to_json = Letterboxd::RssToJson.new(rss_file_path)
    @result = @rss_to_json.process
  end

  it "outputs the expected JSON" do
    expect(@result).to eq json
  end

  private

  def json
    [
      {
        title: "Roald Dahl's Matilda the Musical, 2022 - ★★★★½",
        date: 'Sun, 07 May 2023 11:00:10 +1200',
        url: 'https://letterboxd.com/liburd/film/roald-dahls-matilda-the-musical/',
        image_url: "https://a.ltrbxd.com/resized/film-poster/5/9/3/2/8/2/593282-roald-dahl-s-matilda-the-musical-0-600-0-900-crop.jpg?v=d0fb13284e",
        review: "<p>Didn’t think I’d like it as much as the 1996 film. Not only did it exceed my expectations, but it just might have surpassed the original. Time will tell.</p>"
      }
    ].to_json
  end
end

