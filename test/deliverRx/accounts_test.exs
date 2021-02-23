defmodule DeliverRx.AccountsTest do
  use DeliverRx.DataCase

  alias DeliverRx.Accounts

  describe "pharmacies" do
    alias DeliverRx.Accounts.Pharmacy

    @valid_attrs %{address: "some address", city: "some city", name: "some name", state: "some state", zip: "some zip"}
    @update_attrs %{address: "some updated address", city: "some updated city", name: "some updated name", state: "some updated state", zip: "some updated zip"}
    @invalid_attrs %{address: nil, city: nil, name: nil, state: nil, zip: nil}

    def pharmacy_fixture(attrs \\ %{}) do
      {:ok, pharmacy} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_pharmacy()

      pharmacy
    end

    test "list_pharmacies/0 returns all pharmacies" do
      pharmacy = pharmacy_fixture()
      assert Accounts.list_pharmacies() == [pharmacy]
    end

    test "get_pharmacy!/1 returns the pharmacy with given id" do
      pharmacy = pharmacy_fixture()
      assert Accounts.get_pharmacy!(pharmacy.id) == pharmacy
    end

    test "create_pharmacy/1 with valid data creates a pharmacy" do
      assert {:ok, %Pharmacy{} = pharmacy} = Accounts.create_pharmacy(@valid_attrs)
      assert pharmacy.address == "some address"
      assert pharmacy.city == "some city"
      assert pharmacy.name == "some name"
      assert pharmacy.state == "some state"
      assert pharmacy.zip == "some zip"
    end

    test "create_pharmacy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_pharmacy(@invalid_attrs)
    end

    test "update_pharmacy/2 with valid data updates the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, %Pharmacy{} = pharmacy} = Accounts.update_pharmacy(pharmacy, @update_attrs)
      assert pharmacy.address == "some updated address"
      assert pharmacy.city == "some updated city"
      assert pharmacy.name == "some updated name"
      assert pharmacy.state == "some updated state"
      assert pharmacy.zip == "some updated zip"
    end

    test "update_pharmacy/2 with invalid data returns error changeset" do
      pharmacy = pharmacy_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_pharmacy(pharmacy, @invalid_attrs)
      assert pharmacy == Accounts.get_pharmacy!(pharmacy.id)
    end

    test "delete_pharmacy/1 deletes the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, %Pharmacy{}} = Accounts.delete_pharmacy(pharmacy)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_pharmacy!(pharmacy.id) end
    end

    test "change_pharmacy/1 returns a pharmacy changeset" do
      pharmacy = pharmacy_fixture()
      assert %Ecto.Changeset{} = Accounts.change_pharmacy(pharmacy)
    end
  end

  describe "couriers" do
    alias DeliverRx.Accounts.Courier

    @valid_attrs %{address: "some address", city: "some city", name: "some name", serviced_ids: 42, zip: "some zip"}
    @update_attrs %{address: "some updated address", city: "some updated city", name: "some updated name", serviced_ids: 43, zip: "some updated zip"}
    @invalid_attrs %{address: nil, city: nil, name: nil, serviced_ids: nil, zip: nil}

    def courier_fixture(attrs \\ %{}) do
      {:ok, courier} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_courier()

      courier
    end

    test "list_couriers/0 returns all couriers" do
      courier = courier_fixture()
      assert Accounts.list_couriers() == [courier]
    end

    test "get_courier!/1 returns the courier with given id" do
      courier = courier_fixture()
      assert Accounts.get_courier!(courier.id) == courier
    end

    test "create_courier/1 with valid data creates a courier" do
      assert {:ok, %Courier{} = courier} = Accounts.create_courier(@valid_attrs)
      assert courier.address == "some address"
      assert courier.city == "some city"
      assert courier.name == "some name"
      assert courier.serviced_ids == 42
      assert courier.zip == "some zip"
    end

    test "create_courier/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_courier(@invalid_attrs)
    end

    test "update_courier/2 with valid data updates the courier" do
      courier = courier_fixture()
      assert {:ok, %Courier{} = courier} = Accounts.update_courier(courier, @update_attrs)
      assert courier.address == "some updated address"
      assert courier.city == "some updated city"
      assert courier.name == "some updated name"
      assert courier.serviced_ids == 43
      assert courier.zip == "some updated zip"
    end

    test "update_courier/2 with invalid data returns error changeset" do
      courier = courier_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_courier(courier, @invalid_attrs)
      assert courier == Accounts.get_courier!(courier.id)
    end

    test "delete_courier/1 deletes the courier" do
      courier = courier_fixture()
      assert {:ok, %Courier{}} = Accounts.delete_courier(courier)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_courier!(courier.id) end
    end

    test "change_courier/1 returns a courier changeset" do
      courier = courier_fixture()
      assert %Ecto.Changeset{} = Accounts.change_courier(courier)
    end
  end
end
