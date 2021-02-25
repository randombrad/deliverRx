defmodule DeliverRx.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :address, :string
    field :city, :string
    field :name, :string
    field :state, :string
    field :zip, :string

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:name, :address, :city, :state, :zip])
    |> validate_required([:name, :address, :city, :state, :zip])
  end
end
