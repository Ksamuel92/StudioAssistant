class RecordingSessionsController < ApplicationController

  # GET: /recording_sessions
  get "/recordingsessions" do
    erb :"/recording_sessions/index.html"
  end

  # GET: /recording_sessions/new
  get "/recordingsessions/new" do
    erb :"/recording_sessions/new.html"
  end

  # POST: /recording_sessions
  post "/recordingsessions" do
    redirect "/recordingsessions"
  end

  # GET: /recording_sessions/5
  get "/recordingsessions/:id" do
    erb :"/recording_sessions/show.html"
  end

  # GET: /recording_sessions/5/edit
  get "/recordingsessions/:id/edit" do
    erb :"/recording_sessions/edit.html"
  end

  # PATCH: /recording_sessions/5
  patch "/recordingsessions/:id" do
    redirect "/recordingsessions/:id"
  end

  # DELETE: /recording_sessions/5/delete
  delete "/recordingsessions/:id/delete" do
    redirect "/recordingsessions"
  end
end
