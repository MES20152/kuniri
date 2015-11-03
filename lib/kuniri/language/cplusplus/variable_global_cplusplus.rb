require_relative '../abstract_container/structured_and_oo/variable_global'
require_relative '../container_data/structured_and_oo/variable_global_data'

module Languages

  module Cplusplus

    # @class VariableGlobalCplusplus Handling extern requirements.
    class VariableGlobalCplusplus < Languages::VariableGlobal

      public

        def get_variable(pLine)
          result = detect_variable(pLine)
          return nil unless result

          listOfVariable = []

          result = remove_unnecessary_information(result)

          # Separated by comma, equal or the common case
          if result.split(",").size > 1
            listOfVariable = handle_multiple_declaration_with_comma(result)
          elsif result.split("=").size > 1
            listOfVariable = handle_multiple_declaration_with_equal(result)
          else
            listOfVariable = handle_line_declaration(result)
          end

          return listOfVariable
        end

      protected

        def detect_variable(pLine)
          regexExp = /^\s*(\w*\s+.*;)\s*/
          return nil unless pLine =~ regexExp
          return pLine.scan(regexExp)[0].join("")
        end

        def remove_unnecessary_information(pLine)
          pLine.gsub!(/\s+/," ") if pLine =~ /\s+/
          pLine.gsub!(/\s*\[\]\s*/,"") if pLine =~ /\s*\[\]\s*/
          pLine.gsub!(/\=(.*?),/,", ") if pLine =~ /\=(.*?),/
          pLine.gsub!(/\=(.*?);/,";") if pLine =~ /\=(.*?);/
          pLine.gsub!(/\s*,\s*/,",") if pLine =~ /\s*,\s*/
          pLine.gsub!(/\s*;\s*/,"") if pLine =~ /\s*;\s*/
          return pLine
        end

        # Override
        def prepare_final_string(pString)
          if pString =~ /\s+|:|@|=/
            return pString.gsub!(/\s+|:|@|=/,"")
          end
          return pString
        end

        # Override
        def handle_multiple_declaration_with_comma(pString)
          listOfVariable = []
          kind = pString.split(" ")[0] #Get the kind of the variables.
          pString = pString.split(",")
          pString.each do |variable|
            return nil if variable.scan(/,/).count > 1

            variable.gsub!(/#{kind}\s/,"") if variable =~ /#{kind}\s/
            variable = variable.scan(/.*,/).join("") if variable =~ /.*,/

            return nil if variable =~ /\./

            globalVariable = Languages::VariableGlobalData.new(kind + " " + variable)
            listOfVariable.push(globalVariable)
          end

          return listOfVariable
        end

        # Override
        def handle_multiple_declaration_with_equal(pString)
          listOfVariable = []
          pString = pString.split("=")

          pString.each do |variable|
            return nil if variable =~ /=/

            globalVariable = Languages::VariableGlobalData.new(variable)
            listOfVariable.push(globalVariable)
          end
          value = listOfVariable.pop

          return listOfVariable
        end

        # Override
        def handle_line_declaration(pString)
         listOfVariable = []
          if pString =~ /=/
            pString = pString.scan(/.*=/).join("")
            return nil if pString =~ /\./
          end

          return nil if pString =~ /\./

          globalVariable = Languages::VariableGlobalData.new(pString)
          listOfVariable.push(globalVariable)

          return listOfVariable
        end


    # Class
    end

  # Cplusplus
  end

# Module
end
