defmodule DeliverRx.Accounts.Courier do
  use Ecto.Schema
  import Ecto.Changeset

  schema "couriers" do
    field :address, :string
    field :city, :string
    field :name, :string
    field :state, :string
    field :zip, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(courier, attrs) do
    courier
    |> cast(attrs, [:name, :address, :city, :state, :zip])
    |> validate_required([:name, :address, :city, :state, :zip])
  end
end
