module EmailTemplateReport
  class Engine

    def initialize(template_id)
      @template_id = template_id
    end

    attr_accessor :template_id

    def email_template_statement
      require 'roo'
      @email_template = EmailTemplate.find(@template_id)
      statement_xls = Spreadsheet::Workbook.new
      sheet = statement_xls.create_worksheet :name => "Email Template Upload"
      subject_variables = @email_template.subject.split(/<(.*?)>/)
      subject_variables.select!{|var| var if var[0] == '@' }.compact
      subject_variables = subject_variables.map{|var| var.split('@')[1].classify}
      body_variables = @email_template.body.split(/&lt;(.*?)&gt;/)
      body_variables += @email_template.body.split(/%3C(.*?)%3E/)
      body_variables.select!{|var| var if var[0] == '@' }.compact
      body_variables = body_variables.map{|var| var.split('@')[1].classify}
      header = ['Email'] + subject_variables + body_variables.uniq
      header.uniq!
      sheet.row(0).default_format = Spreadsheet::Format.new(:weight => :bold)
      header.each_with_index do |label, index|
        sheet[0, index] = label
        sheet.column(index).width = 20
      end
      statement_xls
    end
  end
end
