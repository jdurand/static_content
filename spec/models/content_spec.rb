require 'spec_helper'
describe Content do
  it { should allow_mass_assignment_of(:text).as(:admin) }
  [:name, :slug, :text].each do |attribute|
    it { should validate_presence_of(attribute) }
  end
end
