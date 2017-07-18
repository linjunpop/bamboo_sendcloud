defmodule Bamboo.SendcloudHelper do
  @moduledoc """
  Functions for using features specific to Sendcloud e.g. templates
  """

  alias Bamboo.Email

  def template(email, template_name, sub \\ %{}) do
    email
    |> Email.put_private(:template_name, template_name)
    |> Email.put_private(:sub, sub)
  end
end
