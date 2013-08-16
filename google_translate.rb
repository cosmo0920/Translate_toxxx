# -*- coding: utf-8 -*-
# Google翻訳にツイートを投げる
Plugin.create :google_translate do
    command(:google_translate ,
      name: 'このツイートをgoogle翻訳のページで訳す',
      condition: Plugin::Command[:CanReplyAll],
      visible: true,
      role: :timeline) do |opt|
        lang = (UserConfig[:translate_lang] || 'ja')
        Gtk::openurl("http://translate.google.co.jp/#auto|#{lang}|#{opt.messages.first.message}")
  end
  settings 'google翻訳' do
    settings "どの言語からどの言語に翻訳するか入力してください" do
      input "翻訳後", :translate_lang
      tooltip '日本語へは「ja」英語へは「en」と入力してください。'
	end
  end
end
