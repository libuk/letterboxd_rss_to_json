require 'json'
require 'nokogiri'

module Letterboxd
  class RssToJson
    def initialize(rss_file_path)
      rss_content = File.read(rss_file_path)
      @rss_content = Nokogiri::XML(rss_content)
    end

    def process
      rss_to_json
    end

    private

    def rss_to_json
      @json = @rss_content.xpath('//item').map do |item|
        guid = item.at_xpath('guid')&.text

        next if is_list?(guid)

        {
          film_year: item.at_xpath('letterboxd:filmYear')&.text,
          image_url: get_image_url(item.at_xpath('description')&.text),
          published_date: item.at_xpath('pubDate')&.text,
          rating: get_rating(item.at_xpath('letterboxd:memberRating')&.text),
          review: is_review?(guid) ? get_review(item.at_xpath('description')&.text) : nil,
          rewatch: is_rewatch?(item.at_xpath('letterboxd:rewatch')&.text),
          title: item.at_xpath('letterboxd:filmTitle')&.text,
          url: item.at_xpath('link')&.text,
          watched_date: item.at_xpath('letterboxd:watchedDate')&.text
        }
      end.to_json
    end

    def get_image_url(description)
      # Scan the description string for the pattern `<img src="(.*?)"`,
      # which matches any text inside the `src` attribute of an `img` tag.
      # This returns an array of all matches.
      image_src = description.scan(/<img src="(.*?)"/)

      # If there are any matches (i.e., if any `img` tags were found in the description),
      # take the first match and get the first element of that match,
      # which is the value of the `src` attribute.
      # This assumes that the first `img` tag in the description is the one we're interested in.
      image_src = image_src[0][0] if image_src.any?
    end

    def get_review(description)
      # Split the description at the first `</p>`. This will result in an array with two elements:
      # the content before the first `</p>`, and the content after. By calling `.last` we take
      # everything after the first `</p>`. This assumes that the review starts from the second paragraph.
      review_paragraphs = description.split('</p>', 2).last

      # Scan the `review_paragraphs` string for all occurrences of text that is wrapped in `<p>` and `</p>`.
      # This will match all HTML paragraphs. This will result in an array with each element being a paragraph.
      review = review_paragraphs.scan(/<p>.*?<\/p>/)

      # If there are any matches (i.e., if any paragraphs were found in the `review_paragraphs`),
      # join the array elements into a single string with a space (' ') between each element. 
      # This results in a single string containing all the review paragraphs, separated by spaces.
      review = review.join(' ') if review.any?

      # Remove the <p> tags from the resulting string
      review = review.gsub('<p>', '').gsub('</p>', '') if review
    end

    def get_rating(rating)
      has_decimal = rating.include?('.')

      rating_as_number = has_decimal ? rating.to_f : rating.to_i
    end

    def is_list?(guid)
      guid.include?('letterboxd-list')
    end

    def is_review?(guid)
      guid.include?('letterboxd-review')
    end

    def is_rewatch?(rewatch)
      rewatch.include?('Yes')
    end
  end
end

