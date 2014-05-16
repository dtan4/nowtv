# nowtv

[![Build Status](https://travis-ci.org/dtan4/nowtv.png?branch=master)](https://travis-ci.org/dtan4/nowtv)
[![Coverage Status](https://coveralls.io/repos/dtan4/nowtv/badge.png?branch=master)](https://coveralls.io/r/dtan4/nowtv?branch=master)
[![Code Climate](https://codeclimate.com/github/dtan4/nowtv.png)](https://codeclimate.com/github/dtan4/nowtv)
[![Gem Version](https://badge.fury.io/rb/nowtv.svg)](http://badge.fury.io/rb/nowtv)

What TV programs are broadcasted now?

## Installation

Add this line to your application's Gemfile:

    gem 'nowtv'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nowtv

## Usage
With no argument, nowtv outputs the list of programs broadcasted in Tokyo Metropolitan.

    $ nowtv
    [1] NHK総合: NHKスペシャル [22:00 -> 23:15]
    [2] NHK Eテレ: にっぽんの芸能 [22:00 -> 23:00]
    [4] 日本テレビ: ナルニア国物語/第3章:アスラン王と魔法の島  [21:00 -> 22:54]
    [5] テレビ朝日: サッカー・AFC女子アジアカップ2014 グループステージ [22:05 -> 00:15]
    [6] TBSテレビ: アリスの棘 [22:00 -> 22:54]
    [7] テレビ東京: 所さんの学校では教えてくれないそこんトコロ! スペシャル [20:54 -> 22:48]
    [8] フジテレビ: 警視庁総務部縁結び課 桜井はなの事件ファイル [21:00 -> 22:52]
    [9] TOKYO MX: エビ中★グローバル化計画 [22:30 -> 23:00]

If you specify the prefecture name, nowtv outputs the list of programs broadcasted in the specified prefecture.

    $ nowtv osaka
    [1] NHK総合: NHKスペシャル [22:00 -> 23:15]
    [2] NHK Eテレ: にっぽんの芸能 [22:00 -> 23:00]
    [4] MBSテレビ: アリスの棘 [22:00 -> 22:54]
    [6] ABCテレビ: サッカー・AFC女子アジアカップ2014 グループステージ [22:05 -> 00:15]
    [7] テレビ大阪: 所さんの学校では教えてくれないそこんトコロ! スペシャル [21:00 -> 22:48]
    [8] 関西テレビ: 警視庁総務部縁結び課 桜井はなの事件ファイル [21:00 -> 22:52]
    [10] 読売テレビ: ナルニア国物語/第3章:アスラン王と魔法の島  [21:00 -> 22:54]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
