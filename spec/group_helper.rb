require 'rails_helper'

describe Group, type: :model, cnt: true do
    let(:group) { FactoryBot.build(:group) }
    let(:leader) { FactoryBot.build(:leader) }
    
    context 'Should validate' do   
        it 'with name, description, group_type and size present' do
            expect(group).to be_valid
        end

        it 'when leader is not present' do
            group.leader = nil
            expect(group).to be_valid
        end
    end

    context 'Should not be valid' do
        it 'when name is not present' do
            group.name = nil
            expect(group).not_to be_valid
        end

        it 'when description is not present' do
            group.description = nil
            expect(group).not_to be_valid
        end
    end

    context 'Size' do
        it 'should not be present when size is not present' do
            group.size = nil
            expect(group).not_to be_valid
        end

        it 'should be valid when size less than 10' do
            group.size = 8
            expect(group).to be_valid
        end
    end

    context 'Leader Name' do
        it 'should return no lion when no leader is present' do
            group.leader = nil
            expect(group.leader_name).to eq('No leader for this group')
        end

        it 'should return leader full name when leader is present' do
            leader.first_name = 'Umer'
            leader.last_name = 'Qaisar'
            group.leader = leader
            expect(group.leader_name).to eq 'Umer Qaisar'
        end
    end
end
