# Headbang

![Screenshot](screenshot.png)

## Goals/Features

* [x] Ultra fast indexing even with large libraries (>100gB)
* [x] Web-based browser and player with responsible interface
* [x] Keyboard Shortcuts
* [ ] Library management
* [ ] Discover
* [ ] Radio Mode
* [ ] Automatic metadata downloading
  * [ ] Last.fm
    * [ ] Artists
    * [x] Albums
  * [ ] Discogs
    * [ ] Genres
    * [ ] Labels
  * [ ] fanart.tv
    * [ ] Artists
    * [ ] Albums
    * [ ] Labels

## Running

1. git clone git@github.com:knoopx/headbang.app.git headbang-app
2. cd headbang-app
3. bundle
4. rake dist

## Requirements

* `brew install taglib`

## Development

1. git clone git@github.com:knoopx/headbang.git headbang
2. cd headbang
3. bundle
4. rails server
