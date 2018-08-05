class StoryController < ApplicationController


  get '/' do
    # Initialise story and current_sentence objects
    unless session[:story]
      session[:story] = Story.new('Once upon a time, there was big bad wolf.')
      session[:current_sentence] = session[:story].root
    end

    @current_sentence = session[:current_sentence]

    erb :layout
  end

  post '/' do
    next_id = params.keys[0]
    sentence = params[next_id]

    @current_sentence = session[:current_sentence]
    @current_sentence.add_sentence_node(next_id, sentence)
    session[:current_sentence] = @current_sentence

    erb :layout
  end

  get '/select/:id' do
    session[:current_sentence] = session[:current_sentence].get_sentence_node(params[:id])

    redirect to('/')
  end

  get '/back-to-start' do
    session[:current_sentence] = session[:story].root

    redirect to('/')
  end

end
