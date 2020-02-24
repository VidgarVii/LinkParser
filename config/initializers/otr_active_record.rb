# frozen_string_literal: true

OTR::ActiveRecord.configure_from_file! 'config/database.yml'
OTR::ActiveRecord.db_dir = '../db'
OTR::ActiveRecord.migrations_paths = ['../db/migrate']
