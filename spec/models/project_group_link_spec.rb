require 'spec_helper'

describe ProjectGroupLink do
  describe "Associations" do
    it { should belong_to(:group) }
    it { should belong_to(:project) }
  end

  describe "Mass assignment" do
    it { should_not allow_mass_assignment_of(:group_id) }
    it { should_not allow_mass_assignment_of(:project_id) }
  end

  describe "Validation" do
    let!(:project_group_link) { create(:project_group_link) }

    it { should validate_presence_of(:project_id) }
    it { should validate_uniqueness_of(:group_id).scoped_to(:project_id).with_message(/already shared/) }
    it { should validate_presence_of(:group_id) }
  end
end
