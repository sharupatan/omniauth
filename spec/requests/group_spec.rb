require 'rails_helper'

describe 'Groups', type: :request, cnt: true do
    let(:group) { FactoryBot.create(:group) }

    context 'Get /Index' do
        it 'should render index page' do
            get groups_path
            expect(response).to render_template :index
        end

        it 'should render edit page' do
            get edit_group_path(group)
            expect(response).to render_template :edit
        end
    end

    context 'Post /Group' do
        it 'should create a group with valid attributes' do
            post '/groups', params: {group: FactoryBot.attributes_for(:group)}
            expect(response).to redirect_to groups_path
            expect(flash[:notice]).to eq 'Group has created successfully!'
        end
    end
end