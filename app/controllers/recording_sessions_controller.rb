class RecordingSessionsController < ApplicationController

 
  get "/recordingsessions" do
    validate_login
    current_user
    @recording_sessions = current_user.recording_sessions.order(:start_date)
    @clients = current_user.clients.uniq
    erb :"/recording_sessions/index.html"
  end

  get "/recordingsessions/new" do
    # binding.prye
    validate_login
    current_user
    @clients = current_user.clients.uniq
    erb :"/recording_sessions/new.html"
  end

  get "/recordingsessions/:slug/new" do
# binding.pry
  validate_login
  current_user
  @client = Client.find_by_slug(params[:slug])
  erb :"/recording_sessions/new.html"
end


  #h.values_at(:a, :c)

  post "/recordingsessions" do
    # binding.pry
    validate_login
    current_user
    remove_comma_from_integer(params[:recording_session][:budget])
    @client = Client.find_or_create_by(params[:client])
    @recording_session = RecordingSession.new(params[:recording_session])
    # binding.pry
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
    current_user
    can_view?
    validate_login
    current_user
    set_recording_session_and_client
    erb :"/recording_sessions/show.html"
  end


  get "/recordingsessions/:slug/:id/edit" do
    current_user
    can_edit?
    validate_login
    current_user
    set_recording_session_and_client
    erb :"/recording_sessions/edit.html"
  end

  patch "/recordingsessions/:slug/:id" do
    current_user
    can_edit? 
    set_recording_session_and_client
    @recording_session.update(params[:recording_session])
    @client.update(params[:client])
    @recording_session.save
    @client.save
    redirect "/recordingsessions/#{@client.slug}/#{@recording_session.id}"
  end


  delete "/recordingsessions/:slug/:id/delete" do
    current_user
    can_edit? 
    set_recording_session_and_client
    @recording_session.delete
    redirect "/recordingsessions"
  end
  
end