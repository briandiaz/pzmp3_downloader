# pzmp3_downloader
[![Code Climate](https://codeclimate.com/github/briandiaz/pzmp3_downloader/badges/gpa.svg)](https://codeclimate.com/github/briandiaz/pzmp3_downloader) 

## Information

pzmp3_downloader is a song downloader for http://pzmp3.com/

## Getting Started
Just require the gem:

```ruby
require 'pzmp3_downloader'
```

Then call the downloader with:
```ruby
downloader = Downloader::Pzmp3.new
```

### Album

Set the url of the album you want to download by:
```ruby
downloader.download_album 'http://pzmp3.com/music/album/3727/Good-Girl-Gone-Bad.html'
```
This will automatically create a folder named 'Good Girl Gone Bad' and will download every song (listed at the website) of the Rihanna's 'Good Girl Gone Bad'.

### Single Song
If you want to download a single song:
```ruby
downloader.download 'http://pzmp3.com/music/song/28579/The-Real-Slim-Shady.html'
```
This will download the Eminem's 'The Real Slim Shady' song as a file called 'Eminem - The Real Slim Shady.mp3'

## Contributors

Brian Díaz https://github.com/briandiaz
