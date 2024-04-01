function[New_Roll,New_Pitch,New_Yaw] = EulerRatesToEulerAngles(SAMPLING_RATE,Roll,Pitch,Yaw,Roll_Dt,Pitch_Dt,Yaw_Dt)
    New_Roll    = (Roll_Dt * SAMPLING_RATE) + Roll;
    New_Pitch   = (Pitch_Dt * SAMPLING_RATE) + Pitch;
    New_Yaw     = (Yaw_Dt * SAMPLING_RATE) + Yaw;
end