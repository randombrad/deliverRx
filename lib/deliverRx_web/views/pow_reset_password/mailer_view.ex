defmodule DeliverRxWeb.PowResetPassword.MailerView do
  use DeliverRxWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
