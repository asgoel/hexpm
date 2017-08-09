defmodule Hexpm.Web.ResendEmailController do
  use Hexpm.Web, :controller

  def show(conn, _params) do
    render(conn, "show.html", [
      title: "Resend Email Verification",
      container: "container page resend-email",
    ])
  end

  def create(conn, %{"email" => email}) do
    case password_auth(username, password) do
      {:ok, user} ->
        path = conn.params["return"] || user_path(conn, :show, user)

        conn
        |> configure_session(renew: true)
        |> put_session("user_id", user.id)
        |> redirect(to: path)
      {:error, reason} ->
        conn
        |> put_flash(:error, auth_error_message(reason))
        |> put_status(400)
        |> render_show()
    end
  end
end
