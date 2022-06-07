require "application_system_test_case"

class BeatsTest < ApplicationSystemTestCase
  setup do
    @beat = beats(:one)
  end

  test "visiting the index" do
    visit beats_url
    assert_selector "h1", text: "Beats"
  end

  test "creating a Beat" do
    visit beats_url
    click_on "New Beat"

    fill_in "Audio", with: @beat.audio
    fill_in "Beat time", with: @beat.beat_time
    fill_in "Beat titile", with: @beat.beat_titile
    fill_in "Memo", with: @beat.memo
    fill_in "Sample artist", with: @beat.sample_artist
    fill_in "Sample title", with: @beat.sample_title
    click_on "Create Beat"

    assert_text "Beat was successfully created"
    click_on "Back"
  end

  test "updating a Beat" do
    visit beats_url
    click_on "Edit", match: :first

    fill_in "Audio", with: @beat.audio
    fill_in "Beat time", with: @beat.beat_time
    fill_in "Beat titile", with: @beat.beat_titile
    fill_in "Memo", with: @beat.memo
    fill_in "Sample artist", with: @beat.sample_artist
    fill_in "Sample title", with: @beat.sample_title
    click_on "Update Beat"

    assert_text "Beat was successfully updated"
    click_on "Back"
  end

  test "destroying a Beat" do
    visit beats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Beat was successfully destroyed"
  end
end
