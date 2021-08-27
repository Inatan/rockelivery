defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 27,
      address: "Av Azenha 1674",
      cep: "90160003",
      cpf: "66666666666",
      email: "ininhaa2@in.com",
      password: "123456",
      name: "Rafael"
    }
  end

  def user_factory do
    %User{
      age: 27,
      address: "Av Azenha 1674",
      cep: "90160003",
      cpf: "66666666666",
      email: "ininhaa2@in.com",
      password: "123456",
      name: "Rafael",
      id: "86f8984d-77bb-42f4-8f4e-46d406d6e5c3"
    }
  end
end
