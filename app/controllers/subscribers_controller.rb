class SubscribersController < ApplicationController
  
  before_filter :find_subscriber, :only => %w(show edit update destroy)
  
  def index
    @subscribers = Subscriber.find(:all)
  end

  def show
  end

  def new
    @subscriber = Subscriber.new
  end

  def edit
  end

  def create
    @subscriber = Subscriber.new(params[:subscriber])
    if @subscriber.save
      flash[:notice] = 'Subscriber was successfully created.'
      redirect_to(@subscriber)
    else
      render :action => "new"
    end
  end

  def update
    if @subscriber.update_attributes(params[:subscriber])
      flash[:notice] = 'Subscriber was successfully updated.'
      redirect_to(@subscriber)
    else
      render :action => "edit" }
    end
  end

  def destroy
    @subscriber.destroy
    redirect_to(subscribers_url)
  end
  
  def find_subscriber
    @subscriber = Subscriber.find(params[:id])
  end
end
