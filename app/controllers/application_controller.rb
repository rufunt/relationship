class ApplicationController < ActionController::API

  def relationship_params
    associations = {}
    params[:data][:relationships].each do |key,value|
      associations[key.to_sym] = if value[:data].is_a? Array
        value[:data].map { |data| find_related_object(data) }
      else
        find_related_object(value[:data])
      end
    end  
    associations
  end

  private

  def find_related_object(data)
    klass = data[:type].underscore.classify.safe_constantize
    klass.find(data[:id]) if klass
  end
end
