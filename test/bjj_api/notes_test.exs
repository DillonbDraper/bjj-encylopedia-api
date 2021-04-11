defmodule BJJ.NotesTest do
  use BJJ.DataCase

  alias BJJ.Notes

  describe "notes" do
    alias BJJ.Notes.Note

    @valid_attrs %{text: 42, time: "some time", user_id: 42, video_id: 42}
    @update_attrs %{text: 43, time: "some updated time", user_id: 43, video_id: 43}
    @invalid_attrs %{text: nil, time: nil, user_id: nil, video_id: nil}

    def note_fixture(attrs \\ %{}) do
      {:ok, note} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Notes.create_note()

      note
    end

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert Notes.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()
      assert Notes.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      assert {:ok, %Note{} = note} = Notes.create_note(@valid_attrs)
      assert note.text == 42
      assert note.time == "some time"
      assert note.user_id == 42
      assert note.video_id == 42
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Notes.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()
      assert {:ok, %Note{} = note} = Notes.update_note(note, @update_attrs)
      assert note.text == 43
      assert note.time == "some updated time"
      assert note.user_id == 43
      assert note.video_id == 43
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = Notes.update_note(note, @invalid_attrs)
      assert note == Notes.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = Notes.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> Notes.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = Notes.change_note(note)
    end
  end
end
