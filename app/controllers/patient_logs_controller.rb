# frozen_string_literal: true

class PatientRecordsController < ApplicationController
  def patient_log
    @patient_log = PatientLog.where(patient_record_id: patient_params['patient_record_id'])
                                  .order('created_at DESC')
                                  .includes(:loggable)
                                  .offset(patient_params['offset'])
                                  .limit(patient_params['limit'])

    render :patient_log
  end

  private

  def patient_params
    params.require(:patient_log)
          .permit(:patient_record_id, :limit, :offset)
          .with_defaults(limit: 30, offset: 0)
  end
end
