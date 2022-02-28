require "test_helper"

class PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get patients_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_url
    assert_response :success
  end

  test "should create patient" do
    assert_difference("Patient.count") do
      post patients_url, params: { patient: { created_by: @patient.created_by, from_date: @patient.from_date, p_cid: @patient.p_cid, p_name: @patient.p_name, p_phone: @patient.p_phone, to_date: @patient.to_date, transfer_date: @patient.transfer_date, transfer_from: @patient.transfer_from, transfer_to: @patient.transfer_to } }
    end

    assert_redirected_to patient_url(Patient.last)
  end

  test "should show patient" do
    get patient_url(@patient)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_url(@patient)
    assert_response :success
  end

  test "should update patient" do
    patch patient_url(@patient), params: { patient: { created_by: @patient.created_by, from_date: @patient.from_date, p_cid: @patient.p_cid, p_name: @patient.p_name, p_phone: @patient.p_phone, to_date: @patient.to_date, transfer_date: @patient.transfer_date, transfer_from: @patient.transfer_from, transfer_to: @patient.transfer_to } }
    assert_redirected_to patient_url(@patient)
  end

  test "should destroy patient" do
    assert_difference("Patient.count", -1) do
      delete patient_url(@patient)
    end

    assert_redirected_to patients_url
  end
end
