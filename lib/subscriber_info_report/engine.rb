module SubscriberInfoReport
  class Engine

    def initialize(subscriber_group_id,company_id)
      @subscriber_group_id = subscriber_group_id
      @company_id = company_id
    end

    attr_accessor :subscriber_group_id,:company_id

    def subscriber_statement
      @company = Company.find(@company_id)
      subscriber_group = @company.subscriber_groups.find(@subscriber_group_id)
      require 'roo'
      statement_xls = Spreadsheet::Workbook.new
      sheet = statement_xls.create_worksheet :name => 'Subscriber Info Upload'
      custom_fields = @company.custom_fields
      custom_field_ids = custom_fields.map{|field| field.id}
      header = %w[Email Name Contact] + custom_fields.map{|field| field.name}
      header.uniq!
      sheet.row(0).default_format = Spreadsheet::Format.new(:weight => :bold)
      header.each_with_index do |label, index|
        sheet[0, index] = label
        sheet.column(index).width = 20
      end
      row_count = 1
      subscriber_group.subscribers.each do |subscriber|
        custom_field_values = subscriber.custom_field_values
        subscriber_row_values = [subscriber.email,subscriber.name,subscriber.contact] + custom_field_ids.map{|id| custom_field_values.where(custom_field_id: id).first.value rescue nil}
        subscriber_row_values.each_with_index do |content, index|
          sheet[row_count, index] = content
        end
      end
      statement_xls
    end
  end
end
