# Letterboxd RSS to JSON

A program that converts a [letterboxd rss feed](https://letterboxd.com/liburd/rss/) into JSON objects.

```xml
<?xml version='1.0' encoding='utf-8'?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:letterboxd="https://letterboxd.com">
  <channel>
    <title>Letterboxd - Liburd</title>
    <link>https://letterboxd.com/liburd/</link>
    <description>Letterboxd - Liburd</description>
    <atom:link rel="self" href="https://letterboxd.com/liburd/rss/" type="application/rss+xml"/>

    <item>
      <title>Roald Dahl&#039;s Matilda the Musical, 2022 - ★★★★½</title>
      <link>https://letterboxd.com/liburd/film/roald-dahls-matilda-the-musical/</link>
      <guid isPermaLink="false">letterboxd-review-386355645</guid>
      <pubDate>Sun, 7 May 2023 11:00:10 +1200</pubDate>
      <letterboxd:watchedDate>2023-05-06</letterboxd:watchedDate>
      <letterboxd:rewatch>No</letterboxd:rewatch>
      <letterboxd:filmTitle>Roald Dahl&#039;s Matilda the Musical</letterboxd:filmTitle>
      <letterboxd:filmYear>2022</letterboxd:filmYear>
      <letterboxd:memberRating>4.5</letterboxd:memberRating>
      <description>
        <![CDATA[ <p><img src="https://a.ltrbxd.com/resized/film-poster/5/9/3/2/8/2/593282-roald-dahl-s-matilda-the-musical-0-600-0-900-crop.jpg?v=d0fb13284e"/></p><p>Didn’t think I’d like it as much as the 1996 film. Not only did it exceed my expectations, but it just might have surpassed the original. Time will tell.</p> ]]>
      </description>
      <dc:creator>Liburd</dc:creator>
    </item>
  </channel>
</rss>
```

```json
[
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
]
```

## Installation

```bash
bundle install
```

## Usage

```bash
$ ./bin/rss_to_json path/to/my_rss_feed.rss
```
