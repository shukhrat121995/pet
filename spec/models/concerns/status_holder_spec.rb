# frozen_string_literal: true

RSpec.describe StatusHolder do
  subject(:instance) { model_class.new }

  let(:model_class) do
    stub_model_class('DummyModel') do
      self.table_name = 'landing_pages'
      include StatusHolder

      hold_status :draft, :active, :removed
    end
  end

  def create_dummy(status:)
    model_class.create!(status: status, category: 'freelance', slug: FFaker::Internet.unique.slug.parameterize)
  end

  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_inclusion_of(:status).in_array(%i[draft active removed]) }
  its(:status) { is_expected.to eq(:draft) }

  it { is_expected.to be_draft }
  it { is_expected.not_to be_active }
  it { is_expected.not_to be_removed }

  describe 'scopes' do
    let!(:draft_model) { create_dummy(status: :draft) }
    let!(:active_model) { create_dummy(status: :active) }
    let!(:removed_model) { create_dummy(status: :removed) }

    describe '.with_status' do
      specify do
        expect(model_class.with_status(:draft)).to match_array([draft_model])
        expect(model_class.with_status(:active, :removed)).to match_array([active_model, removed_model])
        expect(model_class.with_status).to match_array([])
      end
    end

    describe '.except_status' do
      specify do
        expect(model_class.except_status(:draft)).to match_array([active_model, removed_model])
        expect(model_class.except_status(:active, :removed)).to match_array([draft_model])
        expect(model_class.except_status).to match_array([draft_model, active_model, removed_model])
      end
    end
  end
end
