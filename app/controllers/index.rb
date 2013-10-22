get '/' do
  erb :error
end

get '/:username' do
  @user = TwitterUser.where(username: params[:username]).first_or_create

  if @user.tweets.empty? || @user.tweets_stale?
    erb :_pacman
  else
    @tweets_all_info = @user.cached_tweets
    erb :index
  end
end

post '/:username' do
  @user = TwitterUser.find_by_username(params[:username])
  @user.fetch_tweets!
  @tweets_all_info = @user.cached_tweets
  # erb :index, :layout => !request.xhr? ==> disables layout defaults
end

