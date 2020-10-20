defmodule Server.SchemasTest do
  use Server.DataCase

  alias Server.Schemas

  describe "users" do
    alias Server.Schemas.User

    @valid_attrs %{first_: "some first_", last_name: "some last_name", name: "some name"}
    @update_attrs %{first_: "some updated first_", last_name: "some updated last_name", name: "some updated name"}
    @invalid_attrs %{first_: nil, last_name: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schemas.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Schemas.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Schemas.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Schemas.create_user(@valid_attrs)
      assert user.first_ == "some first_"
      assert user.last_name == "some last_name"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schemas.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Schemas.update_user(user, @update_attrs)
      assert user.first_ == "some updated first_"
      assert user.last_name == "some updated last_name"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Schemas.update_user(user, @invalid_attrs)
      assert user == Schemas.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Schemas.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Schemas.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Schemas.change_user(user)
    end
  end
end
