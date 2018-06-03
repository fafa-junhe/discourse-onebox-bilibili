# name: Bilibili support for Discourse Onebox
# about: Wrap official Bilibili HTML5 player for insertion in Onebox
# version: 0.1.0
# authors: misaka4e21<xyh1996@gmail.com>

class Onebox::Engine::BilibiliOnebox
  include Onebox::Engine

  REGEX = /^https?:\/\/(www\.)?(bilibili.com)\/(video\/)?av(?<id>\d+)/
  matches_regexp REGEX

  def id
    @url.match(REGEX)[:id]
  end

  def to_html
    "<iframe id=\"player\" src=\"//www.bilibili.com/html/player.html?aid=#{id}&page=1&as_wide=1\" scrolling=\"no\" board=\"0\" frameborder=\"no\" framespacing=\"0\" allowfullscreen=\"true\" allowtransparency=\"true\" class=\"video_player\" style=\"border: none; margin: 0 auto;\">"
  end
end
