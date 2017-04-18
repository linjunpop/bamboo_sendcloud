defmodule Bamboo.SendcloudAdapter.ApiError do
  defexception [:message]

  def exception({:plain, %{message: message}}) do
    %__MODULE__{message: message}
  end
  def exception({:http, %{req_body: req_body, response: response}}) do
    filtered_params =
      req_body
      |> Enum.into(%{})

    message = """
    There was a problem sending the email through the Sendcloud API.

    Here is the response:

    #{inspect response, limit: :infinity}

    Here are the params we sent:

    #{inspect filtered_params, pretty: true, limit: :infinity}
    """

    %__MODULE__{message: message}
  end
  def exception(:json) do
    message = """
    There was a problem of parsing the response JSON from Sendcloud API.
    """

    %__MODULE__{message: message}
  end
  def exception({:sendcloud, %{message: msg, code: code}}) do
    message = """
    There was a problem sending the email through the Sendcloud API.

    Error Code:

    #{code}

    Message:

    #{msg}
    """

    %__MODULE__{message: message}
  end
end
