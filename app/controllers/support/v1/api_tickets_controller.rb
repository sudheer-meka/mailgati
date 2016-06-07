class Support::V1::ApiTicketsController < Support::V1::BaseApiController
  require 'net/http'

  def event_webhook
    WebhookSyncWorker.perform_async(params)
    render json: {status: 'OK'}
  end
end
#
#
# Each Email Template
# Total sent
# Total dropped
# total bounced
# Total Delivered
# Total opens
# Total unsubscribes
# Total spam complaints
# Total unique clicks
