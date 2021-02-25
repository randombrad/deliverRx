# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DeliverRx.Repo.insert!(%DeliverRx.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias DeliverRx.Accounts
alias DeliverRx.Customers



pharmacy_data = [
  %{
    name: "BetterRx",
    address: "1275 Kinnear Road",
    city: "Columbus",
    state: "OH",
    zip: "43212"
  },
  %{
    name: "Drugs R Us",
    address: "4925 LA Ave",
    city: "Los Angeles",
    state: "CA",
    zip: "90056"
  },
  %{
    name: "BestRx",
    address: "123 Austin St",
    city: "Austin",
    state: "TX",
    zip: "78702"
  }
]

Enum.each(pharmacy_data, fn(data) ->
    Accounts.create_pharmacy(data)
end)

courier_data = [
  %{
    name: "Same Day Delivery",
    address: "900 Trenton Lane",
    city: "Trenton",
    state: "NJ",
    zip: "08536",
    serviced_id: [1,3]
  }
]

Enum.each(courier_data, fn(data) ->
    Accounts.create_courier(data)
end)

customer_data = [
  %{
    name: "Dwight Shrute",
    address: "100 Beets Way",
    city: "Scranton",
    state: "PA",
    zip: "18503"
  },
  %{
    name: "Micheal Scott",
    address: "100 Paper Way",
    city: "Scranton",
    state: "PA",
    zip: "18503"
  }
]

Enum.each(customer_data, fn(data) ->
    Customers.create_customer(data)
end)

user_data = [
  %{
    email: "admin@BetterRx.com",
    password_hash: "$pbkdf2-sha512$100000$f5dxr77+CIr8J+q+WZ70cw==$Z31RiCOpgouuHS9OLFK7OoLxsQjS3avyyzM/jvvT6DLeqSA2f7905jeUiondAIXu3EnB6002HJ1rWHTzt8NjtA==",
  },
  %{
    email: "admin@sameday.com",
    password_hash: "$pbkdf2-sha512$100000$f5dxr77+CIr8J+q+WZ70cw==$Z31RiCOpgouuHS9OLFK7OoLxsQjS3avyyzM/jvvT6DLeqSA2f7905jeUiondAIXu3EnB6002HJ1rWHTzt8NjtA==",
  }
]

Enum.each(customer_data, fn(data) ->
    Customers.create_customer(data)
end)

add :email, :string, null: false
add :password_hash, :string
add :user_id, :integer
