Dir[File.join(Rails.root, 'lib', 'extensions', '*.rb')].each {|file| require file }