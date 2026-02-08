#!/usr/bin/env ruby
# frozen_string_literal: true
#
# Setup Git identity in ~/.gitconfig.local (local-only, not in dotfiles repo).
# This script:
# - Prompts for GitHub username, Git name, Git email
# - Writes them to ~/.gitconfig.local
# - Optionally shows existing values and asks before overwriting
#
# Note: Your shared ~/.gitconfig (symlinked from dotfiles) should include:
#   [include]
#     path = ~/.gitconfig.local

require "open3"
require "fileutils"

HOME = ENV.fetch("HOME")
LOCAL_FILE = File.join(HOME, ".gitconfig.local")

def run_cmd(*cmd)
  out, err, status = Open3.capture3(*cmd)
  return out.strip if status.success?

  nil
end

def git_installed?
  !run_cmd("git", "--version").nil?
end

def get_cfg(local_file, key)
  v = nil
  if File.file?(local_file)
    v = run_cmd("git", "config", "-f", local_file, "--get", key)
  end
  v = run_cmd("git", "config", "--global", "--get", key) if v.nil? || v.empty?
  v.to_s
end

def prompt_with_default(label, default_value, required: true, validate: nil)
  loop do
    suffix = default_value.to_s.empty? ? "" : " [#{default_value}]"
    print "#{label}#{suffix}: "
    input = STDIN.gets
    exit 1 if input.nil?

    val = input.strip
    val = default_value if val.empty?
    val = val.to_s.strip

    if required && val.empty?
      puts "Please enter a non-empty value."
      next
    end

    if validate && !validate.call(val)
      puts "Please enter a valid value."
      next
    end

    return val
  end
end

def yes?(prompt)
  print prompt
  ans = STDIN.gets
  exit 1 if ans.nil?

  %w[y yes].include?(ans.strip.downcase)
end

unless git_installed?
  warn "Error: git is not installed or not on PATH. Install git and re-run."
  exit 1
end

def_gh_user = get_cfg(LOCAL_FILE, "github.user")
def_name   = get_cfg(LOCAL_FILE, "user.name")
def_email  = get_cfg(LOCAL_FILE, "user.email")

if File.file?(LOCAL_FILE)
  puts "\nFound existing #{LOCAL_FILE}"
  puts "  username in GitHub = #{def_gh_user.empty? ? '<not set>' : def_gh_user}"
  puts "  Your name in GitHub   = #{def_name.empty? ? '<not set>' : def_name}"
  puts "  Your email in GitHub  = #{def_email.empty? ? '<not set>' : def_email}"
  puts

  unless yes?("Overwrite #{LOCAL_FILE}? [y/N] ")
    puts "↩ Skipped writing #{LOCAL_FILE}"
    exit 0
  end
end

gh_user = prompt_with_default("GitHub username", def_gh_user, required: true)
name    = prompt_with_default("Your name in GitHub", def_name, required: true)
email   = prompt_with_default(
  "Your email in GitHub",
  def_email,
  required: true,
  validate: ->(v) { v.match?(/\A[^@\s]+@[^@\s]+\.[^@\s]+\z/) }
)

content = <<~GITCFG
  [user]
    name = #{name}
    email = #{email}

  [github]
    user = #{gh_user}
GITCFG

File.write(LOCAL_FILE, content)
begin
  File.chmod(0o600, LOCAL_FILE)
rescue StandardError
  # Non-fatal on filesystems that don't support chmod the same way
end

puts "\n✓ Wrote #{LOCAL_FILE}"
puts "  Name in GitHub   = #{name}"
puts "  Email in GitHub  = #{email}"
puts "  GitHub username = #{gh_user}"
puts
