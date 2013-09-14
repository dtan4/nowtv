# -*- coding: utf-8 -*-
require 'json'
require 'open-uri'
require 'time'

module Nowtv
  class Client
    API_URL = 'http://asp.tvguide.or.jp/api/broadcasting?ccode=goo&region_code='

    def get_program_list(region_code)
      programs = get_programs(region_code)

      unless programs.length > 1
        $stderr.puts 'Failed to get programs!'
      end

      restruct_program_list(programs)
    end

    def get_programs(region_code)
      url = API_URL + region_code
      JSON.parse(open(url).read.sub(/^\(/, '').sub(/\)$/, ''))['programs']
    rescue ParseError
      []
    end

    def restruct_program_list(programs)
      programs.map do |program|
        {
          station: program["station_name"],
          title: program["title"].gsub('　', ' '), # remove full-width space
          start: Time.parse(program["start"]).strftime("%H:%M"),
          end: Time.parse(program["end"]).strftime("%H:%M")
        }
      end
    end
  end
end
