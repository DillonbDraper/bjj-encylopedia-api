defmodule BJJ.TechniquesTest do
  use BJJ.DataCase

  alias BJJ.Techniques

  describe "techniques" do
    alias BJJ.Techniques.Technique

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def technique_fixture(attrs \\ %{}) do
      {:ok, technique} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Techniques.create_technique()

      technique
    end

    test "list_techniques/0 returns all techniques" do
      technique = technique_fixture()
      assert Techniques.list_techniques() == [technique]
    end

    test "get_technique!/1 returns the technique with given id" do
      technique = technique_fixture()
      assert Techniques.get_technique!(technique.id) == technique
    end

    test "create_technique/1 with valid data creates a technique" do
      assert {:ok, %Technique{} = technique} = Techniques.create_technique(@valid_attrs)
      assert technique.name == "some name"
    end

    test "create_technique/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Techniques.create_technique(@invalid_attrs)
    end

    test "update_technique/2 with valid data updates the technique" do
      technique = technique_fixture()
      assert {:ok, %Technique{} = technique} = Techniques.update_technique(technique, @update_attrs)
      assert technique.name == "some updated name"
    end

    test "update_technique/2 with invalid data returns error changeset" do
      technique = technique_fixture()
      assert {:error, %Ecto.Changeset{}} = Techniques.update_technique(technique, @invalid_attrs)
      assert technique == Techniques.get_technique!(technique.id)
    end

    test "delete_technique/1 deletes the technique" do
      technique = technique_fixture()
      assert {:ok, %Technique{}} = Techniques.delete_technique(technique)
      assert_raise Ecto.NoResultsError, fn -> Techniques.get_technique!(technique.id) end
    end

    test "change_technique/1 returns a technique changeset" do
      technique = technique_fixture()
      assert %Ecto.Changeset{} = Techniques.change_technique(technique)
    end
  end
end
