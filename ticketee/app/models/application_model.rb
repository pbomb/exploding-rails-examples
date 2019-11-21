class ApplicationModel < ROM::Struct
  def self.inherited(klass)
    super
    klass.extend ActiveModel::Naming
    klass.include ActiveModel::Conversion
    
    klass.transform_types { |t| t.omittable }
  end

  def persisted?
    respond_to?(:id) && id.present?
  end
end