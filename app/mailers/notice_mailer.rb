class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_topic.subject
  #
  def sendmail_topic(topic)
    @topic = topic

      mail to: "yuri715lily_momo@yahoo.co.jp",
      subject: 'topicが投稿されました'
<<<<<<< HEAD
   end

   def sendmail_contact(contact)
    @contact = contact

    mail to: @contact.email,
    subject: 'お問い合わせありがとうございました'
=======
>>>>>>> 2dc89222f7b9e71e5c9ca44995dec615fe39b72b

  end
end
