defmodule Bamboo.SendcloudAdapter.HelperTest do
  use ExUnit.Case,async: false

  import Bamboo.Email
  alias Bamboo.SendcloudHelper

  test "adds template information to emails" do
    email = new_email() |> SendcloudHelper.template("test_template_active", %{"name" => ["example_name"], "content" => ["example_content"]})
    assert email.private == %{template_name: "test_template_active", sub: %{"name" => ["example_name"], "content" => ["example_content"]}}

    email = new_email() |> SendcloudHelper.template("test_template_active")
    assert email.private == %{template_name: "test_template_active", sub: %{}}
  end
end
