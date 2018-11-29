require './config/environment'



if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


use Rack::MethodOverride #in order to send PATCH and DELTE request

use UsersController
use WorkoutsController
run ApplicationController
