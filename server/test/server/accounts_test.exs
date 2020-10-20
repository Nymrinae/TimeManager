defmodule Server.UsersTest do
  use Server.DataCase

  alias Server.Users

  describe "users" do
    alias Server.Users.User

    @valid_attrs %{first_: "some first_", last_name: "some last_name", name: "some name"}
    @update_attrs %{first_: "some updated first_", last_name: "some updated last_name", name: "some updated name"}
    @invalid_attrs %{first_: nil, last_name: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Users.create_user(@valid_attrs)
      assert user.first_ == "some first_"
      assert user.last_name == "some last_name"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Users.update_user(user, @update_attrs)
      assert user.first_ == "some updated first_"
      assert user.last_name == "some updated last_name"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end

  describe "admins" do
    alias Server.Users.Admin

    @valid_attrs %{first_: "some first_", last_name: "some last_name", name: "some name"}
    @update_attrs %{first_: "some updated first_", last_name: "some updated last_name", name: "some updated name"}
    @invalid_attrs %{first_: nil, last_name: nil, name: nil}

    def admin_fixture(attrs \\ %{}) do
      {:ok, admin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_admin()

      admin
    end

    test "list_admins/0 returns all admins" do
      admin = admin_fixture()
      assert Users.list_admins() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert Users.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      assert {:ok, %Admin{} = admin} = Users.create_admin(@valid_attrs)
      assert admin.first_ == "some first_"
      assert admin.last_name == "some last_name"
      assert admin.name == "some name"
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{} = admin} = Users.update_admin(admin, @update_attrs)
      assert admin.first_ == "some updated first_"
      assert admin.last_name == "some updated last_name"
      assert admin.name == "some updated name"
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_admin(admin, @invalid_attrs)
      assert admin == Users.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = Users.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> Users.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = Users.change_admin(admin)
    end
  end

  describe "users" do
    alias Server.Users.User

    @valid_attrs %{first_name: "some first_name", last_name: "some last_name"}
    @update_attrs %{first_name: "some updated first_name", last_name: "some updated last_name"}
    @invalid_attrs %{first_name: nil, last_name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Users.create_user(@valid_attrs)
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Users.update_user(user, @update_attrs)
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
