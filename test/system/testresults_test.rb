require "application_system_test_case"

class TestresultsTest < ApplicationSystemTestCase
  setup do
    @testresult = testresults(:one)
  end

  test "visiting the index" do
    visit testresults_url
    assert_selector "h1", text: "Testresults"
  end

  test "should create testresult" do
    visit testresults_url
    click_on "New testresult"

    fill_in "Pid", with: @testresult.pid
    fill_in "Recovered", with: @testresult.recovered
    fill_in "Test result", with: @testresult.test_result
    fill_in "Testdate", with: @testresult.testdate
    click_on "Create Testresult"

    assert_text "Testresult was successfully created"
    click_on "Back"
  end

  test "should update Testresult" do
    visit testresult_url(@testresult)
    click_on "Edit this testresult", match: :first

    fill_in "Pid", with: @testresult.pid
    fill_in "Recovered", with: @testresult.recovered
    fill_in "Test result", with: @testresult.test_result
    fill_in "Testdate", with: @testresult.testdate
    click_on "Update Testresult"

    assert_text "Testresult was successfully updated"
    click_on "Back"
  end

  test "should destroy Testresult" do
    visit testresult_url(@testresult)
    click_on "Destroy this testresult", match: :first

    assert_text "Testresult was successfully destroyed"
  end
end
