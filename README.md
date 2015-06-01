# pzmp3_downloader

## Information

pzmp3_downloader is a song downloader from http://pzmp3.com/

## Getting Started

Instance the downloader with:
```ruby
downloader = Downloader::Pzmp3.new
```

Set the url of the album you want to download by:

```ruby
downloader.download_album 'http://pzmp3.com/music/album/3727/Good-Girl-Gone-Bad.html'
```
This downloads the 'Good Girl Gone Bad' album from Rihanna.

If you want to download a single song:
```ruby
downloader.download 'http://pzmp3.com/music/song/28579/The-Real-Slim-Shady.html'
```
This downloads 'The Real Slim Shady' from Eminem.

## Contributors

Brian Díaz https://github.com/briandiaz
