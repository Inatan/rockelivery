defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Rafael"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valida changeset with the given changes" do
      params = build(:user_params)

      update_params = %{name: "ininha", password: "123456"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "ininha"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = build(:user_params, %{password: "123"})

      response = User.changeset(params)

      expected_response = %{password: ["should be at least 6 character(s)"]}

      assert errors_on(response) == expected_response
    end
  end
end
