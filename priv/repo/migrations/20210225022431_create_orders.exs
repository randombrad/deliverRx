defmodule DeliverRx.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :is_delivered, :boolean, default: false, null: false
      add :pick_up, :utc_datetime
      add :pharmacy_id, references(:pharmacies, on_delete: :nothing)
      add :customer_id, references(:customers, on_delete: :nothing)
      add :courier_id, references(:couriers, on_delete: :nothing)

      timestamps()
    end

    create index(:orders, [:pharmacy_id])
    create index(:orders, [:customer_id])
    create index(:orders, [:courier_id])
  end
end
