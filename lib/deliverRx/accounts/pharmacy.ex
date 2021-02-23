defmodule DeliverRx.Accounts.Pharmacy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pharmacies" do
    field :address, :string
    field :city, :string
    field :name, :string
    field :state, :string
    field :zip, :string

    timestamps()
  end

  @doc false
  def changeset(pharmacy, attrs) do
    pharmacy
    |> cast(attrs, [:name, :address, :city, :state, :zip])
    |> validate_required([:name, :address, :city, :state, :zip])
  end
end
