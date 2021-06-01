class RecordingSessionsController < ApplicationController

  # GET: /recording_sessions
  get "/recording_sessions" do
    erb :"/recording_sessions/index.html"
  end

  # GET: /recording_sessions/new
  get "/recording_sessions/new" do
    erb :"/recording_sessions/new.html"
  end

  # POST: /recording_sessions
  post "/recording_sessions" do
    redirect "/recording_sessions"
  end

  # GET: /recording_sessions/5
  get "/recording_sessions/:id" do
    erb :"/recording_sessions/show.html"
  end

  # GET: /recording_sessions/5/edit
  get "/recording_sessions/:id/edit" do
    erb :"/recording_sessions/edit.html"
  end

  # PATCH: /recording_sessions/5
  patch "/recording_sessions/:id" do
    redirect "/recording_sessions/:id"
  end

  # DELETE: /recording_sessions/5/delete
  delete "/recording_sessions/:id/delete" do
    redirect "/recording_sessions"
  end
end
