require "test_helper"

describe ActorsController do
  let(:actor) { actors :one }

  it "gets index" do
    get :index
    value(response).must_be :success?
    value(assigns(:actors)).wont_be :nil?
  end

  it "gets new" do
    get :new
    value(response).must_be :success?
  end

  it "creates actor" do
    expect {
      post :create, actor: { dob: actor.dob, name: actor.name }
    }.must_change "Actor.count"

    must_redirect_to actor_path(assigns(:actor))
  end

  it "shows actor" do
    get :show, id: actor
    value(response).must_be :success?
  end

  it "gets edit" do
    get :edit, id: actor
    value(response).must_be :success?
  end

  it "updates actor" do
    put :update, id: actor, actor: { dob: actor.dob, name: actor.name }
    must_redirect_to actor_path(assigns(:actor))
  end

  it "destroys actor" do
    expect {
      delete :destroy, id: actor
    }.must_change "Actor.count", -1

    must_redirect_to actors_path
  end
end
