defmodule BJJWeb.VideoView do
  use BJJWeb, :view
  alias BJJWeb.VideoView

  def render("index.json", %{videos: videos}) do
    %{data: render_many(videos, VideoView, "video.json")}
  end

  def render("show.json", %{video: video}) do
    %{data: render_one(video, VideoView, "video.json")}
  end

  def render("video.json", %{video: video}) do
    %{id: video.id,
      url: video.url,
      thumbnail: video.thumbnail,
      title: video.title,
      description: video.description,
      technique_id: video.technique_id,
      gi: video.gi}
  end
end
