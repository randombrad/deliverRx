defmodule DeliverRx.Accounts.Courier do
  use Ecto.Schema
  import Ecto.Changeset

  schema "couriers" do
    field :address, :string
    field :city, :string
    field :name, :string
    field :serviced_ids, :integer
    field :zip, :string

    timestamps()
  end

  @doc false
  def changeset(courier, attrs) do
    courier
    |> cast(attrs, [:name, :address, :city, :zip, :serviced_ids])
    |> validate_required([:name, :address, :city, :zip, :serviced_ids])
  end
end
