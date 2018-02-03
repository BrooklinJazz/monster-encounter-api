class Api::V1::MonstersController < ApplicationController
  @@data = File.read("app/data/monsters.js")

  def index
    # TODO fetch this json data. you may have to not export it as a function
    render :json => @@data.to_json
   end
end
