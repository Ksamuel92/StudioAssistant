class RecordingSessionsController < ApplicationController

  # GET: /recording_sessions
  get "/recordingsessions" do
    if !is_logged_in?
      redirect to '/login'
    end
    current_user
    @recording_sessions = RecordingSession.find_by_user_id(current_user.id)
    
    #perhaps can organize by client or by date?
    #Brings up a list of all recording_sessions that belong to the current user
    #if no recording sessions exist that belong to the current user, let them know they have none and offer to take them to new
    #if there are recording sessions, have a brief overview of the session and a link to the session show page.html
    erb :"/recording_sessions/index.html"
  end

  # GET: /recording_sessions/new
  get "/recordingsessions/new" do
    #grabs form to create a new recording session
    erb :"/recording_sessions/new.html"
  end

  # POST: /recording_sessions
  post "/recordingsessions" do
    #grabs params from recordingsessions/new and make new recordingsessions and clients, associating them both
    #make sure validations pass
    redirect "/recordingsessions"
  end

  # GET: /recording_sessions/5
  get "/recordingsessions/:slug" do
    #what should slug be for recording session? Maybe two slugs, first one client, second one :id/date?
    #Grabs session and shows user details of session (this includes dynamic details based on client information)
    #user should be able to edit session or client information (at this point, user creates both so should be able to edit both)
    erb :"/recording_sessions/show.html"
  end

  # GET: /recording_sessions/5/edit
  get "/recordingsessions/:slug/edit" do
    #edit sesssion and client details. this should only be accessible to the user who owns that session
    erb :"/recording_sessions/edit.html"
  end

  # PATCH: /recording_sessions/5
  patch "/recordingsessions/:slug" do

    redirect "/recordingsessions/:id"
  end

  # DELETE: /recording_sessions/5/delete
  delete "/recordingsessions/:id/delete" do
    redirect "/recordingsessions"
  end
end
