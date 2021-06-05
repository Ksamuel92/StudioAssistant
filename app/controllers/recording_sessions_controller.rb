class RecordingSessionsController < ApplicationController

 
  get "/recordingsessions" do
    validate_login
    current_user
    @recording_sessions = current_user.recording_sessions
    erb :"/recording_sessions/index.html"
  end

  get "/recordingsessions/new" do
    validate_login
    erb :"/recording_sessions/new.html"
  end

  post "/recordingsessions" do
    remove_comma_from_integer(params[:client][:budget])
    current_user
    @client = Client.new(params[:client])
    @recording_session = RecordingSession.new(params[:recording_session])
    
    if !@client.save || !@recording_session.save
      flash[:error] = "Make sure you filled in the required fields!"
      redirect to "/recordingsessions/new"

    else
      current_user.recording_sessions << @recording_session
      @client.recording_sessions << @recording_session
      redirect  "/recordingsessions"
    end
  end

  get "/recordingsessions/:slug/:id" do
    validate_login
    current_user
    set_recording_session_and_client
    erb :"/recording_sessions/show.html"
  end


  get "/recordingsessions/:slug/:id/edit" do
    can_edit? 
    validate_login
    current_user
    set_recording_session_and_client
    erb :"/recording_sessions/edit.html"
  end

  patch "/recordingsessions/:slug/:id" do
    can_edit? 
    set_recording_session_and_client
    @recording_session.update(params[:recording_session])
    @client.update(params[:client])
    @recording_session.save
    @client.save
    redirect "/recordingsessions/#{@client.slug}/#{@recording_session.id}"
  end


  delete "/recordingsessions/:slug/:id/delete" do
    can_edit? 
    set_recording_session_and_client
    @recording_session.destroy
    @client.destroy
    redirect "/recordingsessions"
  end
  
end

