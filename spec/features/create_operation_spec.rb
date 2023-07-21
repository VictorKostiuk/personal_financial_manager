# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Operation", driver: :selenium_chrome, type: :feature do
  let!(:category) { create(:category) }
  it "Creating category" do
    visit operations_path
    operation_formation
    visit operations_path
    expect(page).to have_content "100"
  end
end
