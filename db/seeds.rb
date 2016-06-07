# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@siteAdmin = User.new(:password => 'systemAdmin', :password_confirmation => 'systemAdmin', email: 'systemadmin@mailgati.com')
@siteAdmin.skip_confirmation!
@siteAdmin.save!(validate: false)





Type of Email Status
Send
Delivered
Bounced
Opened
Spam
Unscribe
Clicked
Dropped

We need below stats
Campaign Wise
Group Wise
Month Wise
Day Wise