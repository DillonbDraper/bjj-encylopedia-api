defmodule BJJWeb.TechniqueControllerTest do
  use BJJWeb.ConnCase

  alias BJJ.Techniques
  alias BJJ.Techniques.Technique

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:technique) do
    {:ok, technique} = Techniques.create_technique(@create_attrs)
    technique
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all techniques", %{conn: conn} do
      conn = get(conn, Routes.technique_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create technique" do
    test "renders technique when data is valid", %{conn: conn} do
      conn = post(conn, Routes.technique_path(conn, :create), technique: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.technique_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.technique_path(conn, :create), technique: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update technique" do
    setup [:create_technique]

    test "renders technique when data is valid", %{conn: conn, technique: %Technique{id: id} = technique} do
      conn = put(conn, Routes.technique_path(conn, :update, technique), technique: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.technique_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, technique: technique} do
      conn = put(conn, Routes.technique_path(conn, :update, technique), technique: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete technique" do
    setup [:create_technique]

    test "deletes chosen technique", %{conn: conn, technique: technique} do
      conn = delete(conn, Routes.technique_path(conn, :delete, technique))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.technique_path(conn, :show, technique))
      end
    end
  end

  defp create_technique(_) do
    technique = fixture(:technique)
    %{technique: technique}
  end
end
