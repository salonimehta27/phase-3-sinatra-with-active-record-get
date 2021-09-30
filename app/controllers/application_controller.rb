class ApplicationController < Sinatra::Base
set :default_content_type, 'application/json'
  get '/' do
    { message: "Hello world" }.to_json
  end
  get '/games' do
    Game.all.order(:title).limit(10).to_json
  end
  get '/games/:id' do
  game= Game.find(params[:id])
  game.to_json(only:[:id,:title,:genre,:price],include: {reviews:
    {only:[:score,:comment], include: {user: {only: [:name]}
  }}
  })
  end

end
