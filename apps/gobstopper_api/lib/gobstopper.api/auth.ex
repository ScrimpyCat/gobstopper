defmodule Gobstopper.API.Auth do
    @moduledoc """
      Handles the authorization of session tokens.
    """

    @service Gobstopper.Service.Auth

    @type token :: String.t
    @type uuid :: String.t

    @doc """
      Logout of an identity's active session.
    """
    @spec logout(token) :: :ok
    def logout(token) do
        GenServer.cast(@service, { :logout, token })
        :ok
    end

    @doc """
      Verify an identity's session.

      Returns the unique ID of the identity if verifying a valid session token.
      Otherwise returns `nil`.
    """
    @spec verify(token) :: uuid | nil
    def verify(token), do: GenServer.call(@service, { :verify, token })

    @doc """
      Refresh an identity's session.

      Returns a new session token and disables the previous one. Otherwise returns
      an error.
    """
    @spec refresh(token) :: { :ok, uuid } | { :error, String.t }
    def refresh(token), do: GenServer.call(@service, { :refresh, token })
end
