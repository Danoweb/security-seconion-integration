module Helpers
  def create_successful? params = {:format => :json}
    post :create, params
    response.status.should eq(200)
  end

  def destroy_successful? params = {:format => :json}
    delete :destroy, params
    response.status.should eq(200)
  end

  def index_successful? params = {:format => :json}
    get :index, params
    response.status.should eq(200)
  end

  def show_successful? params = {:format => :json}
    get :show, params
    response.status.should eq(200)
  end

  def can_create_an_object? params
    object = factory params
    object.persisted?
  end

  def factory name, params = nil
    FactoryGirl.create name, params
  end
end
