# frozen_string_literal: true

# name: discourse-onebox-bilibili
# about: discourse onebox for bilibili
# version: 0.1
# authors: fafa_junhe
# url: https://github.com/


class Onebox::Engine::BilibiliOnebox
  include Onebox::Engine

  REGEX = /^https?:\/\/(www\.)?(bilibili.com)\/(video\/)(av|bv)(\w+)/i
  matches_regexp REGEX

  key = 'fZodR9XQDSUm21yCkr6zBqiveYah8bt4xsWpHnJE7jL5VG3guMTKNPAwcF'
  $dic = {}
  for a in 0..57
  	$dic[key[a]]=a
  end
  $s=[11,10,3,8,4,6]
  $xor=177451812
  $add=8728348608
  def decode(in_)
    r=0
    for a in 0..5
      r = $dic[in_[$s[a]]]*58**a + r
    end
  return (r-$add)^$xor
  end

  def id
    match = @url.match(/bv.*|av.*?\//i)
    if match[0].starts_with?("bv")
      match[0].sub("av","")
    else
      decode(match[0])
    end
  end


  def to_html
    "<iframe id=\"player\" src=\"https://www.bilibili.com/html/player.html?aid=#{id}&page=1&as_wide=1\" scrolling=\"no\" board=\"0\" frameborder=\"no\" framespacing=\"0\" allowfullscreen=\"true\" allowtransparency=\"true\" class=\"video_player\" style=\"border: none; margin: 0 auto;\">"
  end
end