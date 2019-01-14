class UsersController < ApplicationController

  get '/signup' do
    if Helpers.logged_in?(session)
      redirect '/tweets'
    end
    erb :'users/signup'
  end

  post '/signup' do
    if !(params.has_value?(""))
      user = User.create(params)
      session[:user_id] = user.id
      redirect '/tweets'
    else
      redirect 'users/signup'
    end
  end

  get '/login' do
    if Helpers.logged_in?(session)
      redirect '/tweets'
    end

    erb :'users/login'
  end

  post "/login" do
		user = User.find_by(username: params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
<<<<<<< HEAD
			redirect "/tweets"
		end
			redirect '/login'
=======
			redirect 'tweets/tweets'
		else
			redirect 'users/login'
		end
>>>>>>> d024950923d9d8e42e92cb3cd326304a1409d2d6
	end

  get "/logout" do
    if Helpers.logged_in?(session)
      session.clear
<<<<<<< HEAD

    end

    redirect "/login"
=======
    else
      redirect '/'
    end

    redirect "/users/login"
>>>>>>> d024950923d9d8e42e92cb3cd326304a1409d2d6
	end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if @user
      erb :'users/show'
<<<<<<< HEAD

=======
    else
      redirect 'users/login'
>>>>>>> d024950923d9d8e42e92cb3cd326304a1409d2d6
    end
  end
end
