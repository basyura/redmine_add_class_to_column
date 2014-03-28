require File.dirname(__FILE__) + '/lib/redmine_add_class_to_column'

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'queries_helper'
  QueriesHelper.send(:include, Redmine::Plugins::RedmineAddClassToClumn)
end

Redmine::Plugin.register :redmine_add_class_to_column do
  name 'Redmine Add Class To Column plugin'
  author 'basyura'
  description 'add class to column'
  version '0.0.1'
  url 'https://github.com/basyura/redmine_add_class_to_column'
  author_url 'http://blog.basyura.org'
end
