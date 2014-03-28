module Redmine
  module Plugins
    module RedmineAddClassToClumn
      def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
          alias_method_chain :column_header, :class
        end
      end

      module InstanceMethods
        def column_header_with_class(column)
          column.sortable ? sort_header_tag(column.name.to_s, :caption => column.caption,
                                                              :default_order => column.default_order,
                                                              :class => "column_header_#{column.name.to_s}"
                                                              ) :
                            content_tag('th', h(column.caption), :class => "column_header_#{column.name.to_s}")
        end
      end
    end
  end
end
