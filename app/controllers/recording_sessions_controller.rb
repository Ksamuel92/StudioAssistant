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

  # GET: /recording_sessions/5
  get "/recordingsessions/:slug/:id" do
    validate_login
    current_user
    set_recording_session_and_client
    erb :"/recording_sessions/show.html"
  end

  # GET: /recording_sessions/5/edit
  get "/recordingsessions/:slug/:id/edit" do
    can_edit? 
    validate_login
    current_user
    set_recording_session_and_client
    erb :"/recording_sessions/edit.html"
  end

  # PATCH: /recording_sessions/5
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

  private

  def can_edit?
    if current_user != RecordingSession.find(params[:id]).user
      flash[:error] = "You are not authorized to edit this session!"
      redirect to "/recording_sessions"
    end

  def validate_login
    if !is_logged_in?
      redirect to '/login'
    end
  end

  def set_recording_session_and_client
    @recording_session = RecordingSession.find_by_id(params[:id])
    @client = Client.find_by_slug(params[:slug])
    if !@recording_session || !@client
      redirect to "/"
      #error message
    end
  end

end

