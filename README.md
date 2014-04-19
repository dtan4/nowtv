# Nowtv

[![Build Status](https://travis-ci.org/dtan4/nowtv.png?branch=master)](https://travis-ci.org/dtan4/nowtv)
[![Coverage Status](https://coveralls.io/repos/dtan4/nowtv/badge.png?branch=master)](https://coveralls.io/r/dtan4/nowtv?branch=master)

Show current TV programs

## Installation

Add this line to your application's Gemfile:

    gem 'nowtv'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nowtv

## Usage
With no argument, list of programs currently broadcasted is shown. Default region is Tokyo Metropolitan.

    $ nowtv
    NHK総合: 仕事ハッケン伝 [16:05 -> 16:55]
    NHK Eテレ: 第68回国民体育大会～スポーツ祭東京2013～ [16:00 -> 17:00]
    日本テレビ: 特選ぶらり途中下車の旅 [15:55 -> 16:53]
    テレビ朝日: 相棒セレクション [15:57 -> 16:53]
    TBSテレビ: Nスタ [15:50 -> 19:00]
    テレビ東京: L4YOU! [16:00 -> 16:52]
    フジテレビ: 踊る大捜査線 [15:50 -> 16:50]
    TOKYO MX: スマイルプリキュア! [16:30 -> 17:00]
    放送大学テレビ: 高齢者の生活保障第1回 [16:00 -> 16:45]

You can specify the default region code/name in `~/.nowtv`. If you set the default region code/name in the first line, `nowtv` command show list of programs in the specified region.

With the region code, list of programs broadcasted in the specified region is shown.

    $ nowtv osaka
    NHK総合: 仕事ハッケン伝 [16:05 -> 16:55]
    NHK Eテレ: 第68回国民体育大会～スポーツ祭東京2013～ [16:00 -> 17:00]
    MBSテレビ: ちちんぷいぷい [14:55 -> 17:50]
    ABCテレビ: 相棒season7 [15:55 -> 16:50]
    関西テレビ: CHANGE [15:53 -> 16:48]
    読売テレビ: かんさい情報ネットten. 1部 [15:50 -> 17:53]
    テレビ大阪: L4YOU! [16:00 -> 16:52]

You can also specify the prefecture name.

    $ nowtv 愛知
    NHK総合: 仕事ハッケン伝 [16:05 -> 16:55]
    NHK Eテレ: 第68回国民体育大会～スポーツ祭東京2013～ [16:00 -> 17:00]
    東海テレビ: リーガル・ハイ [15:54 -> 16:49]
    中京テレビ: キャッチ! [15:50 -> 17:53]
    CBCテレビ: 水戸黄門 [15:56 -> 16:50]
    メ～テレ: 科捜研の女12 [15:49 -> 16:49]
    テレビ愛知: L4YOU! [16:00 -> 16:52]

There is sample `.nowtv` in this repository. In this file, you can check the region code.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
