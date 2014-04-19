# -*- coding: utf-8 -*-
require 'json'
require 'open-uri'
require 'time'
require 'nkf'

module Nowtv
  class Client
    API_URL = 'http://asp.tvguide.or.jp/api/broadcasting?region_code='
    REGION_URL = 'http://asp.tvguide.or.jp/api/regions'

    def get_program_list(region)
      programs = get_programs(region)

      unless programs.length > 1
        region_code_by_name = get_region_code(region)

        unless region_code_by_name
          $stderr.puts 'Failed to get programs!'
          return nil
        end

        programs = get_programs(region_code_by_name)
      end

      restruct_program_list(programs)
    end

    private

    def get_programs(region_code)
      url = API_URL + region_code
      JSON.parse(open(url).read.sub(/^\(/, '').sub(/\)$/, ''))['programs']
    rescue
      []
    end

    def restruct_program_list(programs)
      programs.map do |program|
        {
          station: NKF.nkf("-wZ0", program["station_name"]),
          title: NKF.nkf("-wZ0", program["title"]).gsub("　", " "),
          start_time: Time.parse(program["start"]).strftime("%H:%M"),
          end_time: Time.parse(program["end"]).strftime("%H:%M")
        }
      end
    end

    def get_region_code(region_name)
      region_list = get_region_list
      region_list[region_name.to_sym]
    end

    def get_region_list
      regions = JSON.parse(open(REGION_URL).read.sub(/^\(/, '').sub(/\)$/, ''))['regions']

      regions.inject({}) do |result, region|
        result[region["name"].to_sym] = region["code"]
        result
      end
    rescue
      {}
    end
  end
end
