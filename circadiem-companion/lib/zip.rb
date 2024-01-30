# frozen_string_literal: true

require 'English'
require 'delegate'
require 'singleton'
require 'tempfile'
require 'fileutils'
require 'stringio'
require 'zlib'
Sketchup::require 'circadiem-companion/lib/zip/constants'
Sketchup::require 'circadiem-companion/lib/zip/dos_time'
Sketchup::require 'circadiem-companion/lib/zip/ioextras'
require 'rbconfig'
Sketchup::require 'circadiem-companion/lib/zip/entry'
Sketchup::require 'circadiem-companion/lib/zip/extra_field'
Sketchup::require 'circadiem-companion/lib/zip/entry_set'
Sketchup::require 'circadiem-companion/lib/zip/central_directory'
Sketchup::require 'circadiem-companion/lib/zip/file'
Sketchup::require 'circadiem-companion/lib/zip/input_stream'
Sketchup::require 'circadiem-companion/lib/zip/output_stream'
Sketchup::require 'circadiem-companion/lib/zip/decompressor'
Sketchup::require 'circadiem-companion/lib/zip/compressor'
Sketchup::require 'circadiem-companion/lib/zip/null_decompressor'
Sketchup::require 'circadiem-companion/lib/zip/null_compressor'
Sketchup::require 'circadiem-companion/lib/zip/null_input_stream'
Sketchup::require 'circadiem-companion/lib/zip/pass_thru_compressor'
Sketchup::require 'circadiem-companion/lib/zip/pass_thru_decompressor'
Sketchup::require 'circadiem-companion/lib/zip/crypto/decrypted_io'
Sketchup::require 'circadiem-companion/lib/zip/crypto/encryption'
Sketchup::require 'circadiem-companion/lib/zip/crypto/null_encryption'
Sketchup::require 'circadiem-companion/lib/zip/crypto/traditional_encryption'
Sketchup::require 'circadiem-companion/lib/zip/inflater'
Sketchup::require 'circadiem-companion/lib/zip/deflater'
Sketchup::require 'circadiem-companion/lib/zip/streamable_stream'
Sketchup::require 'circadiem-companion/lib/zip/streamable_directory'
Sketchup::require 'circadiem-companion/lib/zip/errors'

# Rubyzip is a ruby module for reading and writing zip files.
#
# The main entry points are File, InputStream and OutputStream. For a
# file/directory interface in the style of the standard ruby ::File and
# ::Dir APIs then `Sketchup::require 'circadiem-companion/lib/zip/filesystem'` and see FileSystem.
module CircaDiem
  module Zip

  extend self
  attr_accessor :unicode_names,
                :on_exists_proc,
                :continue_on_exists_proc,
                :sort_entries,
                :default_compression,
                :write_zip64_support,
                :warn_invalid_date,
                :case_insensitive_match,
                :force_entry_names_encoding,
                :validate_entry_sizes

  DEFAULT_RESTORE_OPTIONS = {
    restore_ownership:   false,
    restore_permissions: true,
    restore_times:       true
  }.freeze

  def reset!
    @_ran_once = false
    @unicode_names = false
    @on_exists_proc = false
    @continue_on_exists_proc = false
    @sort_entries = false
    @default_compression = ::Zlib::DEFAULT_COMPRESSION
    @write_zip64_support = true
    @warn_invalid_date = true
    @case_insensitive_match = false
    @force_entry_names_encoding = nil
    @validate_entry_sizes = true
  end

  def setup
    yield self unless @_ran_once
    @_ran_once = true
  end

  reset!
end
end

# Copyright (C) 2002, 2003 Thomas Sondergaard
# rubyzip is free software; you can redistribute it and/or
# modify it under the terms of the ruby license.
