defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "age" => 27,
        "address" => "Rua das bananeira, 15",
        "cep" => "12345678",
        "cpf" => "66666666666",
        "email" => "rafael@in.com",
        "password" => "123456",
        "name" => "Rafael"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Rua das bananeira, 15",
                 "age" => 27,
                 "cpf" => "66666666666",
                 "email" => "rafael@in.com",
                 "id" => _id
               }
             } = response
    end

    test "when there are errors, returns errors", %{conn: conn} do
      params = %{
        "password" => "123456",
        "name" => "Rafael"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end

  describe "delete/2" do
    test "when there is a user with a given id, deletes the user", %{conn: conn} do
      id = "86f8984d-77bb-42f4-8f4e-46d406d6e5c3"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
