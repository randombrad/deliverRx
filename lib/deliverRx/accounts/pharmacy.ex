defmodule DeliverRx.Accounts.Pharmacy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pharmacies" do
    field :address, :string
    field :city, :string
    field :name, :string
    field :state, :string
    field :zip, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(pharmacy, attrs) do
    pharmacy
    |> cast(attrs, [:name, :address, :city, :state, :zip,:user_id])
    |> validate_required([:name, :address, :city, :state, :zip])
  end
end
