require_relative 'config/environment'
require_relative 'lib/middleware/app_logger'
require_relative 'lib/middleware/app_runtime'

use AppLogger
use AppRuntime
use OTR::ActiveRecord::ConnectionManagement
use OTR::ActiveRecord::QueryCache
run LinkParser.application
