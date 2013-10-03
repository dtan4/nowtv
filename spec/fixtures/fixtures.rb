# -*- coding: utf-8 -*-
EXAMPLE_VALID_PROGRAMS_BODY = <<-EOS
({"error":0,"ccode":null,"region_code":"tokyo","media":{"code":"02","name":"\u5730\u4e0a\u6ce2"},"region":{"code":"tokyo","name":"\u6771\u4eac"},"programs":[{"station_code":"02-*01","station_name":"NHK\u7dcf\u5408","start":"201309131930","end":"201309131955","title":"\u7279\u5831\u9996\u90fd\u570f"},{"station_code":"02-#01","station_name":"NHK E\u30c6\u30ec","start":"201309131925","end":"201309131948","title":"\u8ab2\u5916\u6388\u696d\u3000\u3088\u3046\u3053\u305d\u5148\u8f29\u30fb\u9078"},{"station_code":"02-NTV","station_name":"\u65e5\u672c\u30c6\u30ec\u30d3","start":"201309131900","end":"201309132054","title":"\u7dca\u6025\u51fa\u52d5\uff01\u9003\u8d70\u8eca\u3092\u8ffd\u3048\uff01\u4ea4\u901a\u8b66\u5bdf\u3000\u771f\u590f\u306e\u5927\u635c\u67fb\u7dda"},{"station_code":"02-EX ","station_name":"\u30c6\u30ec\u30d3\u671d\u65e5","start":"201309131900","end":"201309131954","title":"\u30c9\u30e9\u3048\u3082\u3093\u8a95\u751f\u65e5\uff11\u6642\u9593\u30b9\u30da\u30b7\u30e3\u30eb"},{"station_code":"02-TBS","station_name":"TBS\u30c6\u30ec\u30d3","start":"201309131900","end":"201309131956","title":"\u7206\u5831\uff01\uff34\uff28\uff25\u3000\u30d5\u30e9\u30a4\u30c7\u30fc"},{"station_code":"02-TX ","station_name":"\u30c6\u30ec\u30d3\u6771\u4eac","start":"201309131830","end":"201309131950","title":"\u304a\u91d1\u304c\u306a\u304f\u3066\u3082\u5e78\u305b\u30e9\u30a4\u30d5\u3000\u304c\u3093\u3070\u308c\u30d7\u30a2\u30fc\u30ba\uff01"},{"station_code":"02-CX","station_name":"\u30d5\u30b8\u30c6\u30ec\u30d3","start":"201309131900","end":"201309131957","title":"\u30da\u30b1\u30dd\u30f3"},{"station_code":"02-MX ","station_name":"TOKYO MX","start":"201309131930","end":"201309132000","title":"\u3081\u305e\u3093\u4e00\u523b"},{"station_code":"02-HDT","station_name":"\u653e\u9001\u5927\u5b66\u30c6\u30ec\u30d3","start":"201309131900","end":"201309131945","title":"\u6587\u5316\u4eba\u985e\u5b66\u7b2c\uff11\uff11\u56de"}]})
EOS

EXAMPLE_INVALID_PROGRAMS_BODY = <<-EOS
({"error":0,"ccode":null,"region_code":"aaa","media":{"code":"02","name":"\u5730\u4e0a\u6ce2"},"region":{"code":null,"name":null},"programs":[]})
EOS

EXAMPLE_PROGRAMS =
  [
   {"station_code"=>"02-*01", "station_name"=>"NHK総合", "start"=>"201309131930", "end"=>"201309131955", "title"=>"特報首都圏"},
   {"station_code"=>"02-#01", "station_name"=>"NHK Eテレ", "start"=>"201309131925", "end"=>"201309131948", "title"=>"課外授業　ようこそ先輩・選"},
   {"station_code"=>"02-NTV", "station_name"=>"日本テレビ", "start"=>"201309131900", "end"=>"201309132054", "title"=>"緊急出動！逃走車を追え！交通警察　真夏の大捜査線"},
   {"station_code"=>"02-EX ", "station_name"=>"テレビ朝日", "start"=>"201309131900", "end"=>"201309131954", "title"=>"ドラえもん誕生日１時間スペシャル"},
   {"station_code"=>"02-TBS", "station_name"=>"TBSテレビ", "start"=>"201309131900", "end"=>"201309131956", "title"=>"爆報！ＴＨＥ　フライデー"},
   {"station_code"=>"02-TX ", "station_name"=>"テレビ東京", "start"=>"201309131830", "end"=>"201309131950", "title"=>"お金がなくても幸せライフ　がんばれプアーズ！"},
   {"station_code"=>"02-CX", "station_name"=>"フジテレビ", "start"=>"201309131900", "end"=>"201309131957", "title"=>"ペケポン"},
   {"station_code"=>"02-MX ", "station_name"=>"TOKYO MX", "start"=>"201309131930", "end"=>"201309132000", "title"=>"めぞん一刻"},
   {"station_code"=>"02-HDT", "station_name"=>"放送大学テレビ", "start"=>"201309131900", "end"=>"201309131945", "title"=>"文化人類学第１１回"}
  ]

EXAMPLE_RESTRUCTED_PROGRAMS =
  [
   {station: "NHK総合", title: "特報首都圏", start_time: "19:30", end_time: "19:55"},
   {station: "NHK Eテレ", title: "課外授業 ようこそ先輩・選", start_time: "19:25", end_time: "19:48"},
   {station: "日本テレビ", title: "緊急出動!逃走車を追え!交通警察 真夏の大捜査線", start_time: "19:00", end_time: "20:54"},
   {station: "テレビ朝日", title: "ドラえもん誕生日1時間スペシャル", start_time: "19:00", end_time: "19:54"},
   {station: "TBSテレビ", title: "爆報!THE フライデー", start_time: "19:00", end_time: "19:56"},
   {station: "テレビ東京", title: "お金がなくても幸せライフ がんばれプアーズ!", start_time: "18:30", end_time: "19:50"},
   {station: "フジテレビ", title: "ペケポン", start_time: "19:00", end_time: "19:57"},
   {station: "TOKYO MX", title: "めぞん一刻", start_time: "19:30", end_time: "20:00"},
   {station: "放送大学テレビ", title: "文化人類学第11回", start_time: "19:00", end_time: "19:45"}
  ]

EXAMPLE_REGION_BODY = <<-EOS
({"error":0,"ccode":null,"media_code":null,"regions":[{"code":"hokk","name":"\u5317\u6d77\u9053","pack_code":null},{"code":"aomori","name":"\u9752\u68ee","pack_code":null},{"code":"iwate","name":"\u5ca9\u624b","pack_code":null},{"code":"miya","name":"\u5bae\u57ce","pack_code":null},{"code":"akita","name":"\u79cb\u7530","pack_code":null},{"code":"yamagata","name":"\u5c71\u5f62","pack_code":null},{"code":"fuku","name":"\u798f\u5cf6","pack_code":null},{"code":"ibaraki","name":"\u8328\u57ce","pack_code":null},{"code":"tochigi","name":"\u6803\u6728","pack_code":null},{"code":"gunma","name":"\u7fa4\u99ac","pack_code":null},{"code":"saitama","name":"\u57fc\u7389","pack_code":null},{"code":"chiba","name":"\u5343\u8449","pack_code":null},{"code":"tokyo","name":"\u6771\u4eac","pack_code":null},{"code":"kanagawa","name":"\u795e\u5948\u5ddd","pack_code":null},{"code":"niigata","name":"\u65b0\u6f5f","pack_code":null},{"code":"toyama","name":"\u5bcc\u5c71","pack_code":null},{"code":"ishikawa","name":"\u77f3\u5ddd","pack_code":null},{"code":"fukui","name":"\u798f\u4e95","pack_code":null},{"code":"yamanasi","name":"\u5c71\u68a8","pack_code":null},{"code":"nagano","name":"\u9577\u91ce","pack_code":null},{"code":"gifu","name":"\u5c90\u961c","pack_code":null},{"code":"sizu","name":"\u9759\u5ca1","pack_code":null},{"code":"aichi","name":"\u611b\u77e5","pack_code":null},{"code":"mie","name":"\u4e09\u91cd","pack_code":null},{"code":"siga","name":"\u6ecb\u8cc0","pack_code":null},{"code":"kyoto","name":"\u4eac\u90fd","pack_code":null},{"code":"osaka","name":"\u5927\u962a","pack_code":null},{"code":"hyougo","name":"\u5175\u5eab","pack_code":null},{"code":"nara","name":"\u5948\u826f","pack_code":null},{"code":"wakayama","name":"\u548c\u6b4c\u5c71","pack_code":null},{"code":"tottori","name":"\u9ce5\u53d6","pack_code":null},{"code":"shimane","name":"\u5cf6\u6839","pack_code":null},{"code":"okayama","name":"\u5ca1\u5c71","pack_code":null},{"code":"hirosima","name":"\u5e83\u5cf6","pack_code":null},{"code":"yamagchi","name":"\u5c71\u53e3","pack_code":null},{"code":"tokusima","name":"\u5fb3\u5cf6","pack_code":null},{"code":"kagawa","name":"\u9999\u5ddd","pack_code":null},{"code":"ehime","name":"\u611b\u5a9b","pack_code":null},{"code":"kouchi","name":"\u9ad8\u77e5","pack_code":null},{"code":"fukuoka","name":"\u798f\u5ca1","pack_code":null},{"code":"saga","name":"\u4f50\u8cc0","pack_code":null},{"code":"nagasaki","name":"\u9577\u5d0e","pack_code":null},{"code":"kumamoto","name":"\u718a\u672c","pack_code":null},{"code":"oita","name":"\u5927\u5206","pack_code":null},{"code":"miyazaki","name":"\u5bae\u5d0e","pack_code":null},{"code":"kagosima","name":"\u9e7f\u5150\u5cf6","pack_code":null},{"code":"nawa","name":"\u6c96\u7e04","pack_code":null}]})
EOS

EXAMPLE_REGION_LIST =
  {
   北海道: "hokk",
   青森: "aomori",
   岩手: "iwate",
   宮城: "miya",
   秋田: "akita",
   山形: "yamagata",
   福島: "fuku",
   茨城: "ibaraki",
   栃木: "tochigi",
   群馬: "gunma",
   埼玉: "saitama",
   千葉: "chiba",
   東京: "tokyo",
   神奈川: "kanagawa",
   新潟: "niigata",
   富山: "toyama",
   石川: "ishikawa",
   福井: "fukui",
   山梨: "yamanasi",
   長野: "nagano",
   岐阜: "gifu",
   静岡: "sizu",
   愛知: "aichi",
   三重: "mie",
   滋賀: "siga",
   京都: "kyoto",
   大阪: "osaka",
   兵庫: "hyougo",
   奈良: "nara",
   和歌山: "wakayama",
   鳥取: "tottori",
   島根: "shimane",
   岡山: "okayama",
   広島: "hirosima",
   山口: "yamagchi",
   徳島: "tokusima",
   香川: "kagawa",
   愛媛: "ehime",
   高知: "kouchi",
   福岡: "fukuoka",
   佐賀: "saga",
   長崎: "nagasaki",
   熊本: "kumamoto",
   大分: "oita",
   宮崎: "miyazaki",
   鹿児島: "kagosima",
   沖縄: "nawa"
}
