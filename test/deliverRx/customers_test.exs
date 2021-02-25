defmodule DeliverRx.CustomersTest do
  use DeliverRx.DataCase

  alias DeliverRx.Customers

  describe "customers" do
    alias DeliverRx.Customers.Customer

    @valid_attrs %{address: "some address", city: "some city", name: "some name", state: "some state", zip: "some zip"}
    @update_attrs %{address: "some updated address", city: "some updated city", name: "some updated name", state: "some updated state", zip: "some updated zip"}
    @invalid_attrs %{address: nil, city: nil, name: nil, state: nil, zip: nil}

    def customer_fixture(attrs \\ %{}) do
      {:ok, customer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Customers.create_customer()

      customer
    end

    test "list_customers/0 returns all customers" do
      customer = customer_fixture()
      assert Customers.list_customers() == [customer]
    end

    test "get_customer!/1 returns the customer with given id" do
      customer = customer_fixture()
      assert Customers.get_customer!(customer.id) == customer
    end

    test "create_customer/1 with valid data creates a customer" do
      assert {:ok, %Customer{} = customer} = Customers.create_customer(@valid_attrs)
      assert customer.address == "some address"
      assert customer.city == "some city"
      assert customer.name == "some name"
      assert customer.state == "some state"
      assert customer.zip == "some zip"
    end

    test "create_customer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Customers.create_customer(@invalid_attrs)
    end

    test "update_customer/2 with valid data updates the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{} = customer} = Customers.update_customer(customer, @update_attrs)
      assert customer.address == "some updated address"
      assert customer.city == "some updated city"
      assert customer.name == "some updated name"
      assert customer.state == "some updated state"
      assert customer.zip == "some updated zip"
    end

    test "update_customer/2 with invalid data returns error changeset" do
      customer = customer_fixture()
      assert {:error, %Ecto.Changeset{}} = Customers.update_customer(customer, @invalid_attrs)
      assert customer == Customers.get_customer!(customer.id)
    end

    test "delete_customer/1 deletes the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{}} = Customers.delete_customer(customer)
      assert_raise Ecto.NoResultsError, fn -> Customers.get_customer!(customer.id) end
    end

    test "change_customer/1 returns a customer changeset" do
      customer = customer_fixture()
      assert %Ecto.Changeset{} = Customers.change_customer(customer)
    end
  end
end
