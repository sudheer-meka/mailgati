class ExcelUploader

  def initialize(company, current_user)
    @company, @current_user = company, current_user
  end

  attr_accessor :company

  def subscriber_info_upload(spreadsheet, subscriber_group_id)
    @error = false
    @message = 'OK'
    spreadsheet.each_with_pagename do |name, sheet|
      Rails.logger.info "SHEET NAME ====== >>>> #{name}"
      subscriber_header = sheet.first
      @header_name_index_map = {}
      subscriber_header.each_with_index { |elm, i| @header_name_index_map[elm] = i }
      @subscriber_group = @company.subscriber_groups.find(subscriber_group_id)
      @subscribers = @subscriber_group.subscribers
      custom_field_ids = @company.custom_fields.map{|field| field.id}
      field_name_id_map = {}
      @company.custom_fields.each do |field|
        field_name_id_map[field.id] = field.name
      end
      sheet.each_with_index do |row, index|
        if index > 0
          begin
            Rails.logger.info "ROW ====== >>>> #{row}"
            email = row[(find_header_index('Email'))]
            name = row[(find_header_index('Name'))]
            details_missing_for = ''
            details_missing_for += 'Email, ' if email.nil?
            # details_missing_for += 'Name, ' if name.nil?
            raise "Data at Line #{index + 1} is Blank for: #{details_missing_for}" unless details_missing_for == ''
            @subscriber = @subscribers.find_by(email: email) rescue nil
            @subscriber = @subscriber_group.subscribers.new(email: email) unless @subscriber
            @subscriber.name = name
            contact = row[(find_header_index('Contact'))]
            @subscriber.contact = contact.to_i
            if @subscriber.save
              custom_field_ids.each do |id|
                custom_field_value = @subscriber.custom_field_values.find_or_initialize_by(custom_field_id: id)
                custom_field_value.value = row[(find_header_index(field_name_id_map[id]))]
                custom_field_value.save!
              end
            end
          rescue Exception => invalid
            raise invalid
            @error = true
            @message = invalid.message
          end
          break if @error
        end
      end
      break if @error
    end
    return @message
  end

  def subscriber_info_custom_upload(spreadsheet, subscriber_group_id,header_field_map)
    @error = false
    @message = 'OK'
    spreadsheet.each_with_pagename do |name, sheet|
      Rails.logger.info "SHEET NAME ====== >>>> #{name}"
      subscriber_header = sheet.first
      @header_name_index_map = {}
      subscriber_header.each_with_index { |elm, i| @header_name_index_map[elm] = i }
      @subscriber_group = @company.subscriber_groups.find(subscriber_group_id)
      @subscribers = @subscriber_group.subscribers
      custom_field_ids = []
      field_name_id_map = {}
      @company.custom_fields.each do |field|
        if header_field_map.has_key?(field.name)
          field_name_id_map[field.id] = header_field_map[field.name]
          custom_field_ids << field.id
        end
      end
      sheet.each_with_index do |row, index|
        if index > 0
          begin
            Rails.logger.info "ROW ====== >>>> #{row}"
            raise 'Email Field is mandatory' unless header_field_map['Email']
            email = row[(find_header_index(header_field_map['Email']))]
            name = row[(find_header_index(header_field_map['Name']))] rescue nil
            details_missing_for = ''
            details_missing_for += 'Email, ' if email.nil?
            # details_missing_for += 'Name, ' if name.nil?
            raise "Data at Line #{index + 1} is Blank for: #{details_missing_for}" unless details_missing_for == ''
            @subscriber = @subscribers.find_by(email: email) rescue nil
            @subscriber = @subscriber_group.subscribers.new(email: email) unless @subscriber
            @subscriber.name = name
            contact = row[(find_header_index(header_field_map['Phone']))] rescue nil
            @subscriber.contact = contact.to_i if contact
            if @subscriber.save
              custom_field_ids.each do |id|
                next unless field_name_id_map[id]
                custom_field_value = @subscriber.custom_field_values.find_or_initialize_by(custom_field_id: id)
                custom_field_value.value = row[(find_header_index(field_name_id_map[id]))]
                custom_field_value.save!
              end
            end
          rescue Exception => invalid
            raise invalid
            @error = true
            @message = invalid.message
          end
          break if @error
        end
      end
      break if @error
    end
    return @message
  end

  def find_header_index(find)
    index = @header_name_index_map[find]
    raise "Upload Template has been Modified. Column '#{find}' not found in the Uploaded file. Please Re-Download the Template and Upload" if index.nil?
    index
  end
end
