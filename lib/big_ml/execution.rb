require 'big_ml/base'

module BigML
  class Execution < Base
    EXECUTION_PROPERTIES = [
      :code, :created, :creation_defaults, :description, :dev, :execution, :inputs, 
      :locale, :name, :outputs, :project, :resource, :script, :script_status,
      :scripts, :status, :updated
    ]

    attr_reader *EXECUTION_PROPERTIES

    class << self
      def create(script, options = {})
        response = client.post("/#{resource_name}", {}, { :script => script }.merge!(options))
        self.new(response) if response.success?
      end
    end
  end
end
