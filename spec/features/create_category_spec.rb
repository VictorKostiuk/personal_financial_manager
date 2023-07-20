# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Category", driver: :selenium_chrome, type: :feature do
  it "Registered user creates exercise" do
    visit categories_path
    click_on "New Exercise"
    fill_in "Name", with: "Computer club"
    fill_in "Description", with: "Computer club (user group), a computer users' group"
    click_on "Submit"
    sleep 1
    visit categories_path
    expect(page).to have_content "Computer club"
  end

  include_examples "Examples", Exercise
end
