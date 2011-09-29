# -*- coding: utf-8 -*-
# Google翻訳にツイートを投げる

Module.new do
  lang='ja' #=> ja=Japanese | en=English etc...
  Plugin.create(:google_translate).add_event_filter(:command){ |menu|
    menu[:google_translate] = {
      :slug => :google_translate,
      :name => "このツイートをgoogle翻訳のページで訳す(#{lang})",
      :condition => lambda{ |m| m.message.repliable? },
      :exec => lambda{ |m| Gtk::openurl("http://translate.google.co.jp/#auto|#{lang}|#{m.message}") },
      :visible => true,
      :role => :message }
    [menu]
  }
end
