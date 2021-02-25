defmodule DeliverRx.Repo.Migrations.CreateCouriers do
  use Ecto.Migration

  def change do
    create table(:couriers) do
      add :name, :string
      add :address, :string
      add :city, :string
      add :state, :string
      add :zip, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:couriers, [:user_id])
  end
end
