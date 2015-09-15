require_relative 'output_format'

module Parser

  class XMLOutputFormat < OutputFormat

    public

      # @see OutputFormat
      def class_generate(pClass)
        classString = "<class name=\"#{pClass.name}\""
        classString += "\n\tvisibility=\"#{pClass.visibility}\""
        classString += (pClass.comments.empty?) ? "" :
                                    "\n\tcomments=\"#{pClass.comments}\""
        classString += " >"
        return classString
      end

      # @see OutputFormat
      def constructor_generate(pConstructor)
        # TODO
        return "<constructor name=\"TODO\" >"
      end

      # @see OutputFormat
      def inheritance_generate(pInheritance)
        # TODO
        return "<inheritance name=\"TODO\" />"
      end

      # @see OutputFormat
      def method_generate(pMethod)
        # TODO
        return "<method name=\"TODO\">"
      end

      # @see OutputFormat
      def parameters_generate(pParameters)
        # TODO
        return "<parameter name=\"TODO\">"
      end

      # @see OutputFormat
      def attribute_generate(pAttribute)
        # TODO
        return "<attribute name=\"TODO\">"
      end

      # @see OutputFormat
      def function_generate(pFunction)
        # TODO
        return "<function name=\"TODO\">"
      end

      # @see OutputFormat
      def global_variable_generate(pGlobalVariable)
        # TODO
        return "<globalVariable name=\"TODO\">"
      end

      # @see OutputFormat
      def extern_requirement_generate(pRequire)
        # TODO
        return "<require name=\"TODO\">"
      end

      # @see OutputFormat
      def repetition_generate(pRepetition)
        # TODO
        return "<repetition type=\"TODO\" >"
      end

      # @see OutputFormat
      def module_generate(pModule)
        # TODO
        return "<module name=\"TODO\" \>"
      end


      # @see OutputFormat
      def conditional_generate(pConditional)
        # TODO
        return "<conditional type=\"TODO\">"
      end

  # class
  end

# module
end
