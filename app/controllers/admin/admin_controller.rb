class Admin::AdminController < ApplicationController
  before_filter :authenticate_site_admin
  require 'will_paginate/array'

  def index
    @email_templates = EmailTemplate.where(status: 'Approval Pending')
  end

  def batch_invite
    if params[:id]
      # for sending company wise invitations(bulk)
      @companies = Company.where(id: params[:id])
    else
      # for sending all companies invitations(batch)
      @companies = Company.all
    end
    @companies.each do |company|
      @employees = company.employees.where(is_admin: false)
      @employees.each do |employee|
        employee.user.invite! if (employee.user.invitation_accepted_at.blank?)
      end
    end

    redirect_to :back, :notice => "Quikchex invitations are sent"
  end
end
