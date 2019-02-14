defmodule MyApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyApp.Accounts.Credential

  schema "users" do
    field :email, :string
    has_one :credential, Credential

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
