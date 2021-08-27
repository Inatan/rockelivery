defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created!",
             user: %Rockelivery.User{
               address: "Av Azenha 1674",
               age: 27,
               cep: "90160003",
               cpf: "66666666666",
               email: "ininhaa2@in.com",
               id: "86f8984d-77bb-42f4-8f4e-46d406d6e5c3",
               inserted_at: nil,
               name: "Rafael",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
