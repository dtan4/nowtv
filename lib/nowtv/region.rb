module Nowtv
  class Region
    @prefectures = %w{
    hokkaido
    aomori
    iwate
    miyagi
    akita
    yamagata
    fukushima
    ibaraki
    tochigi
    gunma
    saitama
    chiba
    tokyo
    kanagawa
    niigata
    toyama
    ishikawa
    fukui
    yamanashi
    nagano
    figu
    shizuoka
    aichi
    mie
    shiga
    kyoto
    osaka
    hyogo
    nara
    wakayama
    tottori
    shimane
    okayama
    hiroshima
    yamaguchi
    tokushima
    kagawa
    ehime
    kochi
    fukuoka
    saga
    nagasaki
    kumamoto
    oita
    miyazaki
    kagoshima
    okinawa
    }

    def self.get_region_id(prefecture)
      prefecture = prefecture.downcase
      @prefectures.include?(prefecture) ? @prefectures.index(prefecture) + 1 : 0
    end
  end
end
