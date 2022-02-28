require "application_system_test_case"

class PatientsTest < ApplicationSystemTestCase
  setup do
    @patient = patients(:one)
  end

  test "visiting the index" do
    visit patients_url
    assert_selector "h1", text: "Patients"
  end

  test "should create patient" do
    visit patients_url
    click_on "New patient"

    fill_in "Created by", with: @patient.created_by
    fill_in "From date", with: @patient.from_date
    fill_in "P cid", with: @patient.p_cid
    fill_in "P name", with: @patient.p_name
    fill_in "P phone", with: @patient.p_phone
    fill_in "To date", with: @patient.to_date
    fill_in "Transfer date", with: @patient.transfer_date
    fill_in "Transfer from", with: @patient.transfer_from
    fill_in "Transfer to", with: @patient.transfer_to
    click_on "Create Patient"

    assert_text "Patient was successfully created"
    click_on "Back"
  end

  test "should update Patient" do
    visit patient_url(@patient)
    click_on "Edit this patient", match: :first

    fill_in "Created by", with: @patient.created_by
    fill_in "From date", with: @patient.from_date
    fill_in "P cid", with: @patient.p_cid
    fill_in "P name", with: @patient.p_name
    fill_in "P phone", with: @patient.p_phone
    fill_in "To date", with: @patient.to_date
    fill_in "Transfer date", with: @patient.transfer_date
    fill_in "Transfer from", with: @patient.transfer_from
    fill_in "Transfer to", with: @patient.transfer_to
    click_on "Update Patient"

    assert_text "Patient was successfully updated"
    click_on "Back"
  end

  test "should destroy Patient" do
    visit patient_url(@patient)
    click_on "Destroy this patient", match: :first

    assert_text "Patient was successfully destroyed"
  end
end
