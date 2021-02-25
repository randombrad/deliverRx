defmodule DeliverRx.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :is_delivered, :boolean, default: false
    field :pick_up, :utc_datetime
    field :pharmacy_id, :id
    field :customer_id, :id
    field :courier_id, :id

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:is_delivered, :pick_up])
    |> validate_required([:is_delivered, :pick_up])
  end
end
