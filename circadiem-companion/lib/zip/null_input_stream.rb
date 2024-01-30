# frozen_string_literal: true

module CircaDiem
  module Zip
  module NullInputStream # :nodoc:all
    include CircaDiem::Zip::NullDecompressor
    include CircaDiem::Zip::IOExtras::AbstractInputStream
  end
end
end

# Copyright (C) 2002, 2003 Thomas Sondergaard
# rubyzip is free software; you can redistribute it and/or
# modify it under the terms of the ruby license.
