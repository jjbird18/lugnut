class Page < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Lugnuts COntact Us",
      :to => "lewisd02@emaiol.franklin.edu",
      :from => %("#{name}" <#{email}>)
    }
  end
end