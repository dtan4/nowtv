# -*- coding: utf-8 -*-
require 'json'
require 'open-uri'
require 'time'
require 'nkf'

module Nowtv
  class Client
    API_URL = 'http://www.tvguide.or.jp/TXML301PG.php?type=TVG&regionId='

    def get_program_list(region_id)
      programs = get_programs(region_id)
      restruct_program_list(programs)
    rescue
      raise ParseError, "Failed to parse program data"
    end

    private

    def get_programs(region_id)
      url = API_URL + region_id.to_s
      JSON.parse(open(url).read)["ProgramScheduleInfomartion"]["MediaLocation"]["StationLocation"]
    end

    def restruct_program_list(programs)
      programs.map do |program|
        info = program["ProgramInformation"]

        {
          station: half_width(program["stationDispName"]),
          title: half_width(info["programTitle"]),
          start_time: parse_datetime(info["startDateTime"]),
          end_time: parse_datetime(info["endDateTime"])
        }
      end
    end

    def half_width(str)
      NKF.nkf("-wZ0", str).gsub("　", " ")
    end

    def parse_datetime(datetime)
      date, time = datetime.split(" ")
      hour, minute = time.split(":").map(&:to_i)

      hour >= 24 ? parse_midnight_time(date, hour, minute) : Time.parse(datetime)
    end

    def parse_midnight_time(date_str, hour, minute)
      day_add = hour / 24
      hour %= 24

      datetime = Time.parse(date_str)
      datetime += day_add * 60 * 60 * 24
      datetime += hour * 60 * 60
      datetime += minute * 60

      datetime
    end
  end

  class ParseError < StandardError; end
end
