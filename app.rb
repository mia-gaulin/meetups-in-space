require 'sinatra'
require_relative 'config/application'
require 'will_paginate'
require 'will_paginate/active_record'
enable :sessions

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.order(:title).paginate(:page => params[:page], :per_page => 3)

  erb :'meetups/index'
end

post '/meetups' do
  current_user

  if @current_user.nil?
    flash[:notice] = "You must be logged in to create a new meetup!"
    redirect '/meetups/create'
  else
    @title = params['title']
    @description = params['description']
    @meetup_date = params['meetup_date']
    @location = params['location']

    session[:title] = params['title']
    session[:description] = params['description']
    session[:meetup_date] = params['meetup_date']
    session[:location] = params['location']

    location = Location.find_by(name: @location)

    @meetup = Meetup.new(title: @title, location: location, description: @description, meetup_date: @meetup_date, user_id: @current_user.id)

    if @meetup.valid?
      @meetup.save!
      flash[:notice] = "You have created a new meetup!"
      redirect "/meetups"

    else

      flash[:notice] = "Please make sure you've filled in all of the fields."
      session[:failure] = "Please make sure you've filled in all of the fields."

      if @title != "" then
        session[:title] = @title end

      if @location != "" then
        session[:location] = @location end

      if @description != "" then
        session[:description] = @description end

      if @meetup_date != "" then
        session[:meetup_date] = @meetup_date end

      redirect '/meetups/create'
    end
  end
end

get '/meetups/create' do
  if session[:failure]
    @description = session[:description]
    @title = session[:title]
    @meetup_date = session[:meetup_date]
    @location = session[:location]
    session.delete(:description)
    session.delete(:title)
    session.delete(:location)
    session.delete(:meetup_date)
  end
  erb :'meetups/new'
end

get '/meetups/:id' do
  current_user
  @meetup = Meetup.find(params[:id])
  @creator = User.find(@meetup.user_id)
  @attendees = Attendee.where(meetup: @meetup)
  @users = @attendees.pluck(:user_id)

  id = params[:id]

 erb :'meetups/show'
end

post '/meetups/:id/join' do
  current_user
  id = params[:id]

  if @current_user.nil?
    flash[:notice] = 'Please sign in before joining meetups'
  # elsif
  #   !Attendee.find_by(user_id: session[:user_id], meetup_id: id).nil?
  #   flash[:notice] = 'You have already joined the meetup.'
  else
    @meetup = Meetup.find_by(id: id)
    Attendee.create(user_id: @current_user.id, meetup_id: id)
    flash[:notice] = 'You have joined the meetup.'
  end

  redirect "/meetups/#{id}"
end
