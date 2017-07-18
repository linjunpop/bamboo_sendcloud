defmodule Bamboo.SendcloudAdapterTest do
  use ExUnit.Case,async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias Bamboo.Email
  alias Bamboo.SendcloudAdapter
  alias Bamboo.SendcloudHelper

  @config %{adapter: SendcloudAdapter, api_user: "sumi_developer_test_luTTRI", api_key: "ByRYrryfEVJmYxN2"}

  setup_all do
    :ok
  end

  test "deliver/2 sends from, html and text body, subject, and headers" do
    email = new_email(
      subject: "My Subject",
      text_body: "TEXT BODY",
      html_body: "HTML BODY",
    )
    |> Email.put_header("Reply-To", "reply@example.com")

    use_cassette "success_sample" do
      result =
        email
        |> SendcloudAdapter.deliver(@config)

      assert {:ok, _info} = result
    end
  end

  test "deliver/2 sends template email" do
    email =
      new_email(subject: "Active")
      |> SendcloudHelper.template("test_template_active", %{"%name%" => ["example_name"], "%content%" => ["example_content"]})

    use_cassette "template_success_sample" do
      result =
        email
        |> SendcloudAdapter.deliver(@config)

      assert {:ok, _info} = result
    end
  end

  defp new_email(attrs) do
    attrs = Keyword.merge([
      from: {"Test From", "test@test.sendcloud.org"},
      to: [{"Jun", "jun@example.com"}]
    ], attrs)

    Email.new_email(attrs) |> Bamboo.Mailer.normalize_addresses
  end
end
