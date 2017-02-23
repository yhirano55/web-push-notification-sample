class WebPushNotificationsController < ApplicationController
  before_action :set_web_push_notification, only: [:show, :edit, :update, :destroy]

  # GET /web_push_notifications
  # GET /web_push_notifications.json
  def index
    @web_push_notifications = WebPushNotification.all
  end

  # GET /web_push_notifications/1
  # GET /web_push_notifications/1.json
  def show
  end

  # GET /web_push_notifications/new
  def new
    @web_push_notification = WebPushNotification.new
  end

  # GET /web_push_notifications/1/edit
  def edit
  end

  # POST /web_push_notifications
  # POST /web_push_notifications.json
  def create
    @web_push_notification = WebPushNotification.new(web_push_notification_params)

    respond_to do |format|
      if @web_push_notification.save
        format.html { redirect_to @web_push_notification, notice: 'Web push notification was successfully created.' }
        format.json { render :show, status: :created, location: @web_push_notification }
      else
        format.html { render :new }
        format.json { render json: @web_push_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_push_notifications/1
  # PATCH/PUT /web_push_notifications/1.json
  def update
    respond_to do |format|
      if @web_push_notification.update(web_push_notification_params)
        format.html { redirect_to @web_push_notification, notice: 'Web push notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @web_push_notification }
      else
        format.html { render :edit }
        format.json { render json: @web_push_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_push_notifications/1
  # DELETE /web_push_notifications/1.json
  def destroy
    @web_push_notification.destroy
    respond_to do |format|
      format.html { redirect_to web_push_notifications_url, notice: 'Web push notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_push_notification
      @web_push_notification = WebPushNotification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_push_notification_params
      params.require(:web_push_notification).permit(:title, :body)
    end
end
