module EmailActivityReport
  class Engine

    def initialize(email_template)
      @email_template = email_template
    end

    attr_accessor :email_template

    def stats_statement
      require 'roo'
      statement_xls = Spreadsheet::Workbook.new
      sheet = statement_xls.create_worksheet :name => 'Stats-Report'
      header = %w[Email Name Status]
      sheet.row(0).default_format = Spreadsheet::Format.new(:weight => :bold)
      header.each_with_index do |label, index|
        sheet[0, index] = label
        sheet.column(index).width = 20
      end
      row_count = 1
      @email_template.email_activities.includes(:subscriber).each do |activity|
        subscriber = activity.subscriber
        [subscriber.email,subscriber.name,activity.status].each_with_index do |content, index|
          sheet[row_count, index] = content
        end
        row_count += 1
      end
      statement_xls
    end
  end
end
