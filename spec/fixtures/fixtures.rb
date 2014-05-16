# -*- coding: utf-8 -*-
require "time"

VALID_PROGRAMS_BODY = <<-EOS
{"SystemInfomation":{"id":0},"ProgramScheduleInfomartion":{"mediaId":"1","PackId":"107","stationnumber":8,"Name":{"packName":"\u6771\u4eac","packUrl":""},"MediaLocation":{"StationLocation":[{"stationCode":"Z0031","stationUrl":"http:\/\/www.nhk.or.jp\/","additionalDisplayChannel":"\u5730\u4e0a\u30c7\u30b8\u30bf\u30eb\uff081\uff09","stationDispName":"NHK\u7dcf\u5408","channel":"","channelId":"4228","programnumber":1,"ProgramInformation":{"startDateTime":"2014\/04\/19 21:00","endDateTime":"2014\/04\/19 22:00","programId":"731","programcode":"tokyoZ00310000004228201404192100","officialurl":"","modecode":"100000000110000010000000010000000000000000000000000000000000000000000000","programTitle":"\u30ed\u30f3\u30b0\u30fb\u30b0\u30c3\u30c9\u30d0\u30a4","programSubTitle":"\u300c\u8272\u7537\u6b7b\u3059\u300d","programContent":"\u30df\u30b9\u30c6\u30ea\u30fc\u306e\u91d1\u5b57\u5854\u521d\u30c9\u30e9\u30de\u5316\u3000\u6d45\u91ce\u5fe0\u4fe1\u3000\u7dbe\u91ce\u525b\u3000\u5c0f\u96ea\u3000\u53e4\u7530\u65b0\u592a\u3000\u51a8\u6c38\u611b\u3000\u592a\u7530\u8389\u83dc\u3000\u7530\u53e3\u30c8\u30e2\u30ed\u30f2\u3000\u6edd\u85e4\u8ce2\u4e00\u3000\u9060\u85e4\u61b2\u4e00\u3000\u67c4\u672c\u660e","Genre":{"genreId":"2","color":"ffffcc"},"programExplanation":"\u3000\uff11\uff19\uff15\uff10\u5e74\u4ee3\u534a\u3070\u306e\u6771\u4eac\u3002\u6226\u5f8c\u5fa9\u8208\u304b\u3089\u306e\u5927\u8ee2\u63db\u671f\u306b\u3001\u4eba\u3005\u306e\u4fa1\u5024\u89b3\u304c\u5927\u304d\u304f\u5909\u5316\u3057\u3066\u3044\u304f\u6fc0\u6d41\u306e\u4e2d\u3067\u3001\u771f\u306b\u6b63\u3057\u3044\u9053\u3060\u3051\u3092\u9078\u3073\u751f\u304d\u3066\u3044\u304f\u79c1\u7acb\u63a2\u5075\u30fb\u5897\u6ca2\u78d0\u4e8c(\u6d45\u91ce\u5fe0\u4fe1)\u306e\u59ff\u3092\u63cf\u304f\u30df\u30b9\u30c6\u30ea\u30fc\u3002\u539f\u4f5c\u30ec\u30a4\u30e2\u30f3\u30c9\u30fb\u30c1\u30e3\u30f3\u30c9\u30e9\u30fc\u3001\u811a\u672c\u30fb\u6e21\u8fba\u3042\u3084\u3001\u6f14\u51fa\u30fb\u5800\u5207\u5712\u5065\u592a\u90ce\u3002\u3000\u79c1\u7acb\u63a2\u5075\u30fb\u78d0\u4e8c(\u6d45\u91ce)\u306f\u3001\u9154\u3063\u3071\u3089\u3063\u3066\u5012\u308c\u3066\u3044\u305f\u4fdd(\u7dbe\u91ce\u525b)\u3092\u52a9\u3051\u3066\u4ee5\u6765\u3001\u30d0\u30fc\u3067\u9152\u3092\u914c\u307f\u4ea4\u308f\u3059\u4ef2\u306b\u306a\u308b\u3002\u3042\u308b\u591c\u3001\u30d4\u30b9\u30c8\u30eb\u3092\u624b\u306b\u3057\u305f\u4fdd\u304c\u3001\u78d0\u4e8c\u306e\u4e8b\u52d9\u6240\u306b\u73fe\u308c\u305f\u3002\u8a00\u308f\u308c\u308b\u307e\u307e\u306b\u53f0\u6e7e\u884c\u304d\u306e\u8239\u304c\u51fa\u308b\u6e2f\u307e\u3067\u4fdd\u3092\u9001\u3063\u305f\u78d0\u4e8c\u306f\u3001\u7fcc\u65e5\u3001\u8b66\u5bdf\u306b\u9023\u884c\u3055\u308c\u308b\u3002\u59bb\u6bba\u5bb3\u306e\u5bb9\u7591\u306e\u639b\u304b\u3063\u305f\u4fdd\u306e\u9003\u4ea1\u3092\u624b\u52a9\u3051\u3057\u305f\u3068\u7591\u308f\u308c\u305f\u306e\u3060\u3002","gcode":""}},{"stationCode":"Z0051","stationUrl":"http:\/\/www.nhk.or.jp\/e-tele\/","additionalDisplayChannel":"\u5730\u4e0a\u30c7\u30b8\u30bf\u30eb\uff082\uff09","stationDispName":"NHK E\u30c6\u30ec","channel":"","channelId":"4229","programnumber":1,"ProgramInformation":{"startDateTime":"2014\/04\/19 21:30","endDateTime":"2014\/04\/19 22:00","programId":"815","programcode":"tokyoZ00510000004229201404192130","officialurl":"","modecode":"100000000100000010000000000000000000000000000000000000000000000000000000","programTitle":"\u3089\u3089\u3089\u3000\u30af\u30e9\u30b7\u30c3\u30af","programSubTitle":"\u300c\u68ee\u3068\u6e56\u3068\u97f3\u697d\u3068\uff5e\u30b7\u30d9\u30ea\u30a6\u30b9\u306e\u201c\u30d5\u30a3\u30f3\u30e9\u30f3\u30c7\u30a3\u30a2\u201d\uff5e\u300d","programContent":"\u5317\u6b27\u30b7\u30d9\u30ea\u30a6\u30b9\u306e\u540d\u66f2\u201c\u30d5\u30a3\u30f3\u30e9\u30f3\u30c7\u30a3\u30a2\u201d","Genre":{"genreId":"5","color":"ccffcc"},"programExplanation":"","gcode":""}},{"stationCode":"Z0084","stationUrl":"http:\/\/www.ntv.co.jp\/","additionalDisplayChannel":"\u5730\u4e0a\u30c7\u30b8\u30bf\u30eb\uff084\uff09","stationDispName":"\u65e5\u672c\u30c6\u30ec\u30d3","channel":"","channelId":"4230","programnumber":1,"ProgramInformation":{"startDateTime":"2014\/04\/19 21:54","endDateTime":"2014\/04\/19 26:00","programId":"856","programcode":"tokyoZ00840000004230201404192154","officialurl":"","modecode":"100000000100000000000000000000000000000000000000000000000000000000000000","programTitle":"\u30b3\u30eb\u30af\u3092\u629c\u304f\u77ac\u9593","programSubTitle":"","programContent":"","Genre":{"genreId":"8","color":null},"programExplanation":"","gcode":""}},{"stationCode":"Z0085","stationUrl":"http:\/\/www.tbs.co.jp\/","additionalDisplayChannel":"\u5730\u4e0a\u30c7\u30b8\u30bf\u30eb\uff086\uff09","stationDispName":"TBS\u30c6\u30ec\u30d3","channel":"","channelId":"4231","programnumber":1,"ProgramInformation":{"startDateTime":"2014\/04\/19 21:54","endDateTime":"2014\/04\/19 22:00","programId":"897","programcode":"tokyoZ00850000004231201404192154","officialurl":"","modecode":"100000000100000010000000000000000000000000000000000000000000000000000000","programTitle":"\u30b9\u30c3\u30d4\u30f3\uff3a","programSubTitle":"","programContent":"","Genre":{"genreId":"6","color":null},"programExplanation":"","gcode":""}},{"stationCode":"Z0086","stationUrl":"http:\/\/www.fujitv.co.jp\/","additionalDisplayChannel":"\u5730\u4e0a\u30c7\u30b8\u30bf\u30eb\uff088\uff09","stationDispName":"\u30d5\u30b8\u30c6\u30ec\u30d3","channel":"","channelId":"4232","programnumber":1,"ProgramInformation":{"startDateTime":"2014\/04\/19 21:00","endDateTime":"2014\/04\/19 23:10","programId":"938","programcode":"tokyoZ00860000004232201404192100","officialurl":"","modecode":"100000000100000010000000000000000000000000000000000000000000000000000000","programTitle":"\u3055\u3093\u307e\uff06\u304f\u308a\u3043\u3080\u306e\u7b2c\uff11\uff17\u56de\u82b8\u80fd\u754c(\u79d8)\u500b\u4eba\u60c5\u5831\u30b0\u30e9\u30f3\u30d7\u30ea","programSubTitle":"","programContent":"\u8d85\u8c6a\u83ef\u82b8\u80fd\u4eba\uff13\uff15\u4eba\u96c6\u7d50(\u79d8)\u8d64\u9762\u904e\u53bb\u6620\u50cf\u5927\u6d41\u51fa\u4eba\u6c17\u5973\u5b50\u30a2\u30ca\u65b0\u4eba\u6642\u4ee3\u77e5\u3089\u308c\u3056\u308b\u82b8\u80fd\u4eba\u5bb6\u65cf\uff13\u5104\u7a3c\u3050\u6b66\u4e95\u58ee\u3044\u3068\u3053\uff2d\u306e\u5148\u7956\u306f\u6c34\u6238\u9ec4\u9580\uff01\uff01\u738b\u8005\u8179\u82b8\uff36\uff33\u86ed\u5b50\u30e9\u30c3\u30d7\uff36\uff33\u4e94\u6708\u30c0\u30f3\u30b9(\u79d8)\u73cd\u7279\u6280\u3000\u660e\u77f3\u5bb6\u3055\u3093\u307e\u3000\u304f\u308a\u3043\u3080\u3057\u3061\u3085\u30fc\u3000\u52a0\u85e4\u7dbe\u5b50\u3000\u30a2\u30cb\u30de\u30eb\u6d5c\u53e3\u3000\u30a6\u30fc\u30de\u30f3\u30e9\u30c3\u30b7\u30e5\u30a2\u30ef\u30fc\u3000\u86ed\u5b50\u80fd\u53ce\u3000\u5ddd\u5408\u4fca\u4e00\u3000\uff2a\uff2f\uff39\u3000\u6b66\u4e95\u58ee\u3000\u30c7\u30cb\u30b9","Genre":{"genreId":"6","color":null},"programExplanation":"","gcode":""}},{"stationCode":"Z0087","stationUrl":"http:\/\/www.tv-asahi.co.jp\/","additionalDisplayChannel":"\u5730\u4e0a\u30c7\u30b8\u30bf\u30eb\uff085\uff09","stationDispName":"\u30c6\u30ec\u30d3\u671d\u65e5","channel":"","channelId":"4233","programnumber":1,"ProgramInformation":{"startDateTime":"2014\/04\/19 21:00","endDateTime":"2014\/04\/19 23:06","programId":"981","programcode":"tokyoZ00870000004233201404192100","officialurl":"","modecode":"100000000110000010000000000000000000000000001000000000000000000000000000","programTitle":"\u9006\u8ee2\u5831\u9053\u306e\u5973(\uff13)","programSubTitle":"\u300c\u30ef\u30b1\u3042\u308a\u4e3b\u5a66\u30ad\u30e3\u30b9\u30bf\u30fc\u304c\u6311\u3080\u706b\u30c0\u30eb\u30de\u9023\u7d9a\u6bba\u4eba\u5c01\u5370\u3055\u308c\u305f\u76ee\u6483\u8a3c\u8a00\uff01\u88ab\u5bb3\u8005\u3092\u7d50\u3076\uff15\u5e74\u524d\u306e\u51a4\u7f6a\u4e8b\u4ef6\uff01\uff1f\u5fa9\u8b90\u306e\u708e\u304c\u3042\u3076\u308a\u51fa\u3059\u8b0e\u306e\u8a18\u61b6\u300d","programContent":"\u3000\u9ad8\u5cf6\u793c\u5b50\u3000\u539f\u7530\u9f8d\u4e8c\u3000\u6c34\u91ce\u4e45\u7f8e\u3000\u4e2d\u539f\u4e08\u96c4\u3000\u76ca\u5ca1\u5fb9\u3000\u8fd1\u6c5f\u8c37\u592a\u6717\u3000\u79cb\u672c\u7950\u5e0c\u3000\u671d\u5009\u4f38\u4e8c\u3000\u82e5\u8449\u7adc\u4e5f\u3000\u6e21\u8fba\u54f2","Genre":{"genreId":"2","color":"ffffcc"},"programExplanation":"","gcode":""}},{"stationCode":"Z0088","stationUrl":"http:\/\/www.tv-tokyo.co.jp\/","additionalDisplayChannel":"\u5730\u4e0a\u30c7\u30b8\u30bf\u30eb\uff087\uff09","stationDispName":"\u30c6\u30ec\u30d3\u6771\u4eac","channel":"","channelId":"4234","programnumber":1,"ProgramInformation":{"startDateTime":"2014\/04\/19 21:54","endDateTime":"2014\/04\/19 22:00","programId":"1037","programcode":"tokyoZ00880000004234201404192154","officialurl":"http:\/\/www.tv-tokyo.co.jp\/manbo\/","modecode":"100000000100000010000000000000000000000000000000000000000000000000000000","programTitle":"\u3074\u304b\u3074\u304b\u30de\u30f3\u30dc","programSubTitle":"","programContent":"\u7c21\u5358\u5bb6\u4e8b\u8853","Genre":{"genreId":"8","color":null},"programExplanation":"","gcode":""}},{"stationCode":"Z0016","stationUrl":"http:\/\/www.mxtv.co.jp\/","additionalDisplayChannel":"\u5730\u4e0a\u30c7\u30b8\u30bf\u30eb\uff089\uff09","stationDispName":"TOKYO MX","channel":"","channelId":"4235","programnumber":1,"ProgramInformation":{"startDateTime":"2014\/04\/19 21:58","endDateTime":"2014\/04\/19 22:00","programId":"669","programcode":"tokyoZ00160000004235201404192158","officialurl":"","modecode":"100000000100000000000000000000000000000000000000000000000000000000000000","programTitle":"\uff34\uff2f\uff2b\uff39\uff2f\u3000\uff2d\uff38\u3000\uff2e\uff25\uff37\uff33","programSubTitle":"","programContent":"\u3000\u9e7f\u5185\u7f8e\u6c99","Genre":{"genreId":"9","color":null},"programExplanation":"","gcode":""}}]}}}
EOS

INVALID_PROGRAMS_BODY = <<-EOS
{"SystemInfomation":{"id":0},"ProgramScheduleInfomartion":null}
EOS

PROGRAM_LIST =
  [
   {
    station: "NHK総合",
    channel_id: 1,
    title: "ロング・グッドバイ",
    start_time: Time.parse("2014/04/19 21:00"),
    end_time: Time.parse("2014/04/19 22:00")
   },
   {
    station: "NHK Eテレ",
    channel_id: 2,
    title: "ららら クラシック",
    start_time: Time.parse("2014/04/19 21:30"),
    end_time: Time.parse("2014/04/19 22:00")
   },
   {
    station: "日本テレビ",
    channel_id: 4,
    title: "コルクを抜く瞬間",
    start_time: Time.parse("2014/04/19 21:54"),
    end_time: Time.parse("2014/04/20 02:00")
   },
   {
    station: "テレビ朝日",
    channel_id: 5,
    title: "逆転報道の女(3)",
    start_time: Time.parse("2014/04/19 21:00"),
    end_time: Time.parse("2014/04/19 23:06")
   },
   {
    station: "TBSテレビ",
    title: "スッピンZ",
    channel_id: 6,
    start_time: Time.parse("2014/04/19 21:54"),
    end_time: Time.parse("2014/04/19 22:00")
   },
   {
    station: "テレビ東京",
    channel_id: 7,
    title: "ぴかぴかマンボ",
    start_time: Time.parse("2014/04/19 21:54"),
    end_time: Time.parse("2014/04/19 22:00")
   },
   {
    station: "フジテレビ",
    channel_id: 8,
    title: "さんま&くりぃむの第17回芸能界(秘)個人情報グランプリ",
    start_time: Time.parse("2014/04/19 21:00"),
    end_time: Time.parse("2014/04/19 23:10")
   },
   {
    station: "TOKYO MX",
    channel_id: 9,
    title: "TOKYO MX NEWS",
    start_time: Time.parse("2014/04/19 21:58"),
    end_time: Time.parse("2014/04/19 22:00")
   }
  ]
