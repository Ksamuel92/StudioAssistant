class RecordingSessionsController < ApplicationController

  # GET: /recording_sessions
  get "/recordingsessions" do
    if !is_logged_in?
      redirect to '/login'
    end
    current_user
    @recording_sessions = current_user.recording_sessions
    # binding.pry
    # @user_recording_sessions = recording_sessions

    
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
    # binding.pry
  #  if params[:recording_sessions][:start_date] = ""
    # redirect to "/recordingsessions/new"
    #error message
  #  end
    remove_comma_from_integer(params[:client][:budget])
    current_user
    client = Client.new(params[:client])
    recording_session = RecordingSession.new(params[:recording_session])
    
    if !client.save || !recording_session.save
      redirect to "/recordingsessions/new"
      #error message
    else

      user.recording_sessions << recording_session
      client.recording_sessions << recording_session
      # user.clients << client
      redirect  "/recordingsessions"
    end
    #grabs params from recordingsessions/new and make new recordingsessions and clients, associating them both
    #make sure validations pass
    # redirect  "/recordingsessions"
  end

  # GET: /recording_sessions/5
  get "/recordingsessions/:slug/:id" do
   
  current_user
  find_session_and_client
    erb :"/recording_sessions/show.html"
  end

  # GET: /recording_sessions/5/edit
  get "/recordingsessions/:slug/:id/edit" do
  if !is_logged_in?
      redirect to '/login'
    end
    @user = current_user
    @recording_session = RecordingSession.find_by_id(params[:id])
    @client = Client.find_by_slug(params[:slug])
    erb :"/recording_sessions/edit.html"
  end

  # PATCH: /recording_sessions/5
  patch "/recordingsessions/:slug/:id" do
    # binding.pry
    recording_session = RecordingSession.find_by_id(params[:id])
    client = Client.find_by_slug(params[:slug])

    recording_session.update(params[:recording_session])
    client.update(params[:client])
    # @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    # @song.genre_ids = params[:genres]
    recording_session.save
    client.save
    redirect "/recordingsessions/#{client.slug}/#{recording_session.id}"
  end


  delete "/recordingsessions/:slug/:id/delete" do
    # binding.pry
    recording_session = RecordingSession.find_by_id(params[:id])
    client = Client.find_by_slug(params[:slug])

    recording_session.destroy
    client.destroy
    redirect "/recordingsessions"
  end

  private

  def set_recording_session_and_client
    @recording_session = RecordingSession.find_by_id(params[:id])
    @client = Client.find_by_slug(params[:slug])
    if !@recording_session || !@client
      redirect to "/"
      #error message
    end
  end

end

