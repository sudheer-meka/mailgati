si@siteAdmin = User.new(:password => 'systemAdmin', :password_confirmation => 'systemAdmin', email: 'systemadmin@mailgati.com')
@siteAdmin.skip_confirmation!
@siteAdmin.save!(validate: false)
