class RecordingSessionstartDate:datesController < ApplicationController

  # GET: /recording_sessionstart_date:dates
  get "/recording_sessionstart_date:dates" do
    erb :"/recording_sessionstart_date:dates/index.html"
  end

  # GET: /recording_sessionstart_date:dates/new
  get "/recording_sessionstart_date:dates/new" do
    erb :"/recording_sessionstart_date:dates/new.html"
  end

  # POST: /recording_sessionstart_date:dates
  post "/recording_sessionstart_date:dates" do
    redirect "/recording_sessionstart_date:dates"
  end

  # GET: /recording_sessionstart_date:dates/5
  get "/recording_sessionstart_date:dates/:id" do
    erb :"/recording_sessionstart_date:dates/show.html"
  end

  # GET: /recording_sessionstart_date:dates/5/edit
  get "/recording_sessionstart_date:dates/:id/edit" do
    erb :"/recording_sessionstart_date:dates/edit.html"
  end

  # PATCH: /recording_sessionstart_date:dates/5
  patch "/recording_sessionstart_date:dates/:id" do
    redirect "/recording_sessionstart_date:dates/:id"
  end

  # DELETE: /recording_sessionstart_date:dates/5/delete
  delete "/recording_sessionstart_date:dates/:id/delete" do
    redirect "/recording_sessionstart_date:dates"
  end
end
