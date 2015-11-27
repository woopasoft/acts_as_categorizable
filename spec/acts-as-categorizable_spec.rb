require 'spec_helper'

describe 'ActsAsCategorizable' do
  before do
    Page.acts_as_categorizable
  end

  let(:page) { Page.create(title: 'Page') }
  let(:category) { Category.create(title: 'Category', slug: 'category') }

  context 'Adding a category to a page' do
    before do
      page.category = category
    end

    it 'should have the category assigned' do
      expect(page.category.title).to eq(category.title)
    end

    it 'should have one category assigned' do
      expect(page.category).not_to be_nil
    end

    it 'should be in the pages from that category' do
      expect(Page.in_category(category)).to include(page)
    end
  end
end