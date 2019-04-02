------------------------------------------------------------------------------
-- (c) Copyright 2019 Vyaire Medical, or one of its subsidiaries.
--     All Rights Reserved.
------------------------------------------------------------------------------
-- Tests fabian Terminal Interface defined in FTI-define
----------------------------------------------------------------------------------------

fti = require "FTI-define"

local function EXPECT_EQ(xValue, xExpected, xMsg)
    assert(xValue == xExpected, 'ASSERT: ' .. xMsg .. '. Value is ' .. tonumber(xValue) .. ', expected ' .. tonumber(xExpected))
end

function test_VentModeRange()
    local minMode = 1
    local maxMode = 10
    
    local isValidMode = (minMode >= FTI.ventMode.eIPPV) and (maxMode <= FTI.ventMode.eO2Therapy)
    assert(isValidMode, 'ASSERT: Vent Mode Out-of-range')

    local expectedServiceMode = 15  
    local isServiceMode = FTI.ventMode.eSERVICE == expectedServiceMode
    assert(isServiceMode, 'ASSERT: Invalid Service Mode')
end

function test_VentModes()
    test_VentModeRange()

    local mode = FTI.ventMode  -- expected Value
    EXPECT_EQ(mode.eNONE     ,    0,      'Vent Mode eNONE     ')
    EXPECT_EQ(mode.eIPPV     ,    1,      'Vent Mode eIPPV     ')
    EXPECT_EQ(mode.eSIPPV    ,    2,      'Vent Mode eSIPPV    ')
    EXPECT_EQ(mode.eSIMV     ,    3,      'Vent Mode eSIMV     ')
    EXPECT_EQ(mode.eSIMVPSV  ,    4,      'Vent Mode eSIMVPSV  ')
    EXPECT_EQ(mode.ePSV      ,    5,      'Vent Mode ePSV      ')
    EXPECT_EQ(mode.eCPAP     ,    6,      'Vent Mode eCPAP     ')
    EXPECT_EQ(mode.eNCPAP    ,    7,      'Vent Mode eNCPAP    ')
    EXPECT_EQ(mode.eDUOPAP   ,    8,      'Vent Mode eDUOPAP   ')
    EXPECT_EQ(mode.eHFO      ,    9,      'Vent Mode eHFO      ')
    EXPECT_EQ(mode.eO2Therapy,   10,      'Vent Mode eO2Therapy')
    EXPECT_EQ(mode.eSERVICE  ,   15,      'Vent Mode eSERVICE  ')
end

function test_ModeOption1()
    local modeOpt1 = FTI.ModeOption1                         -- expected Value
    EXPECT_EQ(modeOpt1.eStartStopBit                        ,  0, 'ModeOption1 eStartStopBit                         ')
    EXPECT_EQ(modeOpt1.eStateVolumnGuaranteeBit             ,  1, 'ModeOption1 eStateVolumnGuaranteeBit              ')
    EXPECT_EQ(modeOpt1.eStateVolumnLimitBit                 ,  2, 'ModeOption1 eStateVolumnLimitBit                  ')
    EXPECT_EQ(modeOpt1.eVentilatorRangeBit                  ,  3, 'ModeOption1 eVentilatorRangeBit                   ')
    EXPECT_EQ(modeOpt1.eFlowSensorCalibrationRunningBit     ,  4, 'ModeOption1 eFlowSensorCalibrationRunningBit      ')
    EXPECT_EQ(modeOpt1.eO2CompensationEnabledBit            ,  5, 'ModeOption1 eO2CompensationEnabledBit             ')
    EXPECT_EQ(modeOpt1.eExhalationValveCalibrationRunningBit,  6, 'ModeOption1 eExhalationValveCalibrationRunningBit ')
    EXPECT_EQ(modeOpt1.eTriggerModeBit                      ,  7, 'ModeOption1 eTriggerModeBit                       ')
    EXPECT_EQ(modeOpt1.eCalibrationProcess_21_O2_RunningBit ,  8, 'ModeOption1 eCalibrationProcess_21_O2_RunningBit  ')
    EXPECT_EQ(modeOpt1.eCalibrationProcess_100_O2_RunningBit,  9, 'ModeOption1 eCalibrationProcess_100_O2_RunningBit ')
    EXPECT_EQ(modeOpt1.eTubeSet_InfantFlow_MediJetBit       , 10, 'ModeOption1 eTubeSet_InfantFlow_MediJetBit        ')
    EXPECT_EQ(modeOpt1.eTubeSet_InfantFlowLPBit             , 11, 'ModeOption1 eTubeSet_InfantFlowLPBit              ')
    EXPECT_EQ(modeOpt1.eIERatioHFOBit11                     , 12, 'ModeOption1 eIERatioHFOBit11                      ')
    EXPECT_EQ(modeOpt1.eIERatioHFOBit12                     , 13, 'ModeOption1 eIERatioHFOBit12                      ')
    EXPECT_EQ(modeOpt1.eInternalUseBit                      , 14, 'ModeOption1 eInternalUseBit                       ')
    EXPECT_EQ(modeOpt1.eManualBreathRunningBit              , 15, 'ModeOption1 eManualBreathRunningBit               ')
end

function test_ModeOption2()
    local modeOpt2 = FTI.ModeOption2            -- expected Value
    EXPECT_EQ(modeOpt2.ePressureRiseControlBit0 ,  0, 'ModeOption2 ePressureRiseControlBit0  ')
    EXPECT_EQ(modeOpt2.ePressureRiseControlBit1 ,  1, 'ModeOption2 ePressureRiseControlBit1  ')
    EXPECT_EQ(modeOpt2.eHFORecruitmentBit       ,  2, 'ModeOption2 eHFORecruitmentBit        ')
    EXPECT_EQ(modeOpt2.eHFOFlowBit              ,  3, 'ModeOption2 eHFOFlowBit               ')
    EXPECT_EQ(modeOpt2.eReservedBit             ,  4, 'ModeOption2 eReservedBit              ')
    EXPECT_EQ(modeOpt2.eBiasFlowBit             ,  5, 'ModeOption2 eBiasFlowBit              ')
    EXPECT_EQ(modeOpt2.eTriggerModeBit6         ,  6, 'ModeOption2 eTriggerModeBit6          ')
    EXPECT_EQ(modeOpt2.eTriggerModeBit7         ,  7, 'ModeOption2 eTriggerModeBit7          ')
    EXPECT_EQ(modeOpt2.eTriggerModeBit8         ,  8, 'ModeOption2 eTriggerModeBit8          ')
    EXPECT_EQ(modeOpt2.eFOTOscillationRunningBit,  9, 'ModeOption2 eFOTOscillationRunningBit ')
    EXPECT_EQ(modeOpt2.eLeakCompensationBit10   , 10, 'ModeOption2 eLeakCompensationBit10    ')
    EXPECT_EQ(modeOpt2.eLeakCompensationBit11   , 11, 'ModeOption2 eLeakCompensationBit11    ')
end

function test_para_get_VentSettings()
    local vs = FTI.para_get_VentSettings                -- expected Value
    EXPECT_EQ(vs.eTERMINAL_GET_VENT_RUNSTATE          ,  0x09, 'eTERMINAL_GET_VENT_RUNSTATE          ')
    EXPECT_EQ(vs.eTERMINAL_GET_STATE_VLimit           ,  0x0A, 'eTERMINAL_GET_STATE_VLimit           ')
    EXPECT_EQ(vs.eTERMINAL_GET_STATE_VGarant          ,  0x0B, 'eTERMINAL_GET_STATE_VGarant          ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_VentRange        ,  0x0C, 'eTERMINAL_GET_PARAM_VentRange        ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_IERatioHFO       ,  0x0D, 'eTERMINAL_GET_PARAM_IERatioHFO       ')
    EXPECT_EQ(vs.eTERMINAL_GET_MANBREATHrunning       ,  0x0E, 'eTERMINAL_GET_MANBREATHrunning       ')
    EXPECT_EQ(vs.eTERMINAL_GET_PressureRiseCtrl       ,  0x0F, 'eTERMINAL_GET_PressureRiseCtrl       ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_HFOFreqRec       ,  0x10, 'eTERMINAL_GET_PARAM_HFOFreqRec       ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_HFOFlow          ,  0x11, 'eTERMINAL_GET_PARAM_HFOFlow          ')
    EXPECT_EQ(vs.eTERMINAL_GET_LeakCompensation       ,  0x12, 'eTERMINAL_GET_LeakCompensation       ')
    EXPECT_EQ(vs.eTERMINAL_GET_TriggerOption          ,  0x13, 'eTERMINAL_GET_TriggerOption          ')
    EXPECT_EQ(vs.eTERMINAL_GET_FOToscillationState    ,  0x14, 'eTERMINAL_GET_FOToscillationState    ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_PINSP            ,  0x15, 'eTERMINAL_GET_PARAM_PINSP            ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_PEEP             ,  0x16, 'eTERMINAL_GET_PARAM_PEEP             ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_PPSV             ,  0x17, 'eTERMINAL_GET_PARAM_PPSV             ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_BPM              ,  0x18, 'eTERMINAL_GET_PARAM_BPM              ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_HFAmpl           ,  0x19, 'eTERMINAL_GET_PARAM_HFAmpl           ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_HFAmplMax        ,  0x1A, 'eTERMINAL_GET_PARAM_HFAmplMax        ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_HFFreq           ,  0x1B, 'eTERMINAL_GET_PARAM_HFFreq           ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_O2               ,  0x1C, 'eTERMINAL_GET_PARAM_O2               ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_IFlow            ,  0x1D, 'eTERMINAL_GET_PARAM_IFlow            ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_EFlow            ,  0x1E, 'eTERMINAL_GET_PARAM_EFlow            ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_Risetime         ,  0x1F, 'eTERMINAL_GET_PARAM_Risetime         ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_ITime            ,  0x20, 'eTERMINAL_GET_PARAM_ITime            ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_ETime            ,  0x21, 'eTERMINAL_GET_PARAM_ETime            ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_HFPMean          ,  0x22, 'eTERMINAL_GET_PARAM_HFPMean          ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_HFPMeanRec       ,  0x23, 'eTERMINAL_GET_PARAM_HFPMeanRec       ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_VLimit           ,  0x24, 'eTERMINAL_GET_PARAM_VLimit           ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_VGarant          ,  0x25, 'eTERMINAL_GET_PARAM_VGarant          ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_AbortCriterionPSV,  0x26, 'eTERMINAL_GET_PARAM_AbortCriterionPSV')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_TherapieFlow     ,  0x27, 'eTERMINAL_GET_PARAM_TherapieFlow     ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_Trigger          ,  0x28, 'eTERMINAL_GET_PARAM_Trigger          ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_Flowmin          ,  0x29, 'eTERMINAL_GET_PARAM_Flowmin          ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_CPAP             ,  0x2A, 'eTERMINAL_GET_PARAM_CPAP             ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_PManual          ,  0x2B, 'eTERMINAL_GET_PARAM_PManual          ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_Backup           ,  0x2C, 'eTERMINAL_GET_PARAM_Backup           ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_ITimeRec         ,  0x2D, 'eTERMINAL_GET_PARAM_ITimeRec         ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_ETIMERec         ,  0x2E, 'eTERMINAL_GET_PARAM_ETIMERec         ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_SPO2LOW          ,  0x2F, 'eTERMINAL_GET_PARAM_SPO2LOW          ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_SPO2HIGH         ,  0x30, 'eTERMINAL_GET_PARAM_SPO2HIGH         ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_FIO2LOW          ,  0x31, 'eTERMINAL_GET_PARAM_FIO2LOW          ')
    EXPECT_EQ(vs.eTERMINAL_GET_PARAM_FIO2HIGH         ,  0x32, 'eTERMINAL_GET_PARAM_FIO2HIGH         ')
    EXPECT_EQ(vs.eTERMINAL_GET_STATE_PRICO            ,  0x33, 'eTERMINAL_GET_STATE_PRICO            ')
end

function test_para_set_settingData()
    local sd = FTI.para_set_settingData                -- expected Value
    EXPECT_EQ(sd.eTERMINAL_SET_VENT_RUNSTATE          ,  0x55, 'eTERMINAL_SET_VENT_RUNSTATE          ')
    EXPECT_EQ(sd.eTERMINAL_SET_STATE_VLimit           ,  0x56, 'eTERMINAL_SET_STATE_VLimit           ')
    EXPECT_EQ(sd.eTERMINAL_SET_STATE_VGarant          ,  0x57, 'eTERMINAL_SET_STATE_VGarant          ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_VentRange        ,  0x58, 'eTERMINAL_SET_PARAM_VentRange        ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_IERatioHFO       ,  0x59, 'eTERMINAL_SET_PARAM_IERatioHFO       ')
    EXPECT_EQ(sd.eTERMINAL_SET_MANBREATHrunning       ,  0x5A, 'eTERMINAL_SET_MANBREATHrunning       ')
    EXPECT_EQ(sd.eTERMINAL_SET_PressureRiseCtrl       ,  0x5B, 'eTERMINAL_SET_PressureRiseCtrl       ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_HFOFreqRec       ,  0x5C, 'eTERMINAL_SET_PARAM_HFOFreqRec       ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_HFOFlow          ,  0x5D, 'eTERMINAL_SET_PARAM_HFOFlow          ')
    EXPECT_EQ(sd.eTERMINAL_SET_LeakCompensation       ,  0x5E, 'eTERMINAL_SET_LeakCompensation       ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_PINSP            ,  0x60, 'eTERMINAL_SET_PARAM_PINSP            ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_PEEP             ,  0x61, 'eTERMINAL_SET_PARAM_PEEP             ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_PPSV             ,  0x62, 'eTERMINAL_SET_PARAM_PPSV             ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_BPM              ,  0x63, 'eTERMINAL_SET_PARAM_BPM              ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_HFAmpl           ,  0x64, 'eTERMINAL_SET_PARAM_HFAmpl           ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_HFAmplMax        ,  0x65, 'eTERMINAL_SET_PARAM_HFAmplMax        ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_HFFreq           ,  0x66, 'eTERMINAL_SET_PARAM_HFFreq           ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_O2               ,  0x67, 'eTERMINAL_SET_PARAM_O2               ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_IFlow            ,  0x68, 'eTERMINAL_SET_PARAM_IFlow            ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_EFlow            ,  0x6A, 'eTERMINAL_SET_PARAM_EFlow            ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_RiseTime         ,  0x6B, 'eTERMINAL_SET_PARAM_RiseTime         ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_ITime            ,  0x6C, 'eTERMINAL_SET_PARAM_ITime            ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_ETime            ,  0x6D, 'eTERMINAL_SET_PARAM_ETime            ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_HFPMean          ,  0x6E, 'eTERMINAL_SET_PARAM_HFPMean          ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_HFPMeanRec       ,  0x6F, 'eTERMINAL_SET_PARAM_HFPMeanRec       ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_VLimit           ,  0x70, 'eTERMINAL_SET_PARAM_VLimit           ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_VGarant          ,  0x71, 'eTERMINAL_SET_PARAM_VGarant          ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_AbortCriterionPSV,  0x72, 'eTERMINAL_SET_PARAM_AbortCriterionPSV')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_TherapieFlow     ,  0x73, 'eTERMINAL_SET_PARAM_TherapieFlow     ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_Trigger          ,  0x74, 'eTERMINAL_SET_PARAM_Trigger          ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_Flowmin          ,  0x75, 'eTERMINAL_SET_PARAM_Flowmin          ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_CPAP             ,  0x76, 'eTERMINAL_SET_PARAM_CPAP             ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_PManual          ,  0x77, 'eTERMINAL_SET_PARAM_PManual          ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_Backup           ,  0x78, 'eTERMINAL_SET_PARAM_Backup           ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_ITimeRec         ,  0x79, 'eTERMINAL_SET_PARAM_ITimeRec         ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_O2_FLUSH         ,  0x7A, 'eTERMINAL_SET_PARAM_O2_FLUSH         ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_SPO2LOW          ,  0x7B, 'eTERMINAL_SET_PARAM_SPO2LOW          ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_SPO2HIGH         ,  0x7C, 'eTERMINAL_SET_PARAM_SPO2HIGH         ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_FIO2LOW          ,  0x7D, 'eTERMINAL_SET_PARAM_FIO2LOW          ')
    EXPECT_EQ(sd.eTERMINAL_SET_PARAM_FIO2HIGH         ,  0x7E, 'eTERMINAL_SET_PARAM_FIO2HIGH         ')
    EXPECT_EQ(sd.eTERMINAL_SET_STATE_PRICO            ,  0x7F, 'eTERMINAL_SET_STATE_PRICO            ')
end

function test_para_measure_response()
    local mr = FTI.para_measure_response   -- expected Value
    EXPECT_EQ(mr.eNone                    ,   0, 'eNone                    ')
    EXPECT_EQ(mr.eActiveVentMode          ,   1, 'eActiveVentMode          ')
    EXPECT_EQ(mr.ePmax_HIBYTE             ,   2, 'ePmax_HIBYTE             ')
    EXPECT_EQ(mr.ePmax_LOBYTE             ,   3, 'ePmax_LOBYTE             ')
    EXPECT_EQ(mr.ePmitt_HIBYTE            ,   4, 'ePmitt_HIBYTE            ')
    EXPECT_EQ(mr.ePmitt_LOBYTE            ,   5, 'ePmitt_LOBYTE            ')
    EXPECT_EQ(mr.ePEEP_HIBYTE             ,   6, 'ePEEP_HIBYTE             ')
    EXPECT_EQ(mr.ePEEP_LOBYTE             ,   7, 'ePEEP_LOBYTE             ')
    EXPECT_EQ(mr.eDynamicCompliance_HIBYTE,   8, 'eDynamicCompliance_HIBYTE')
    EXPECT_EQ(mr.eDynamicCompliance_LOBYTE,   9, 'eDynamicCompliance_LOBYTE')
    EXPECT_EQ(mr.eC20C_HIBYTE             ,  10, 'eC20C_HIBYTE             ')
    EXPECT_EQ(mr.eC20C_LOBYTE             ,  11, 'eC20C_LOBYTE             ')
    EXPECT_EQ(mr.eResistance_HIBYTE       ,  12, 'eResistance_HIBYTE       ')
    EXPECT_EQ(mr.eResistance_LOBYTE       ,  13, 'eResistance_LOBYTE       ')
    EXPECT_EQ(mr.eMV_HIBYTE               ,  14, 'eMV_HIBYTE               ')
    EXPECT_EQ(mr.eMV_LOBYTE               ,  15, 'eMV_LOBYTE               ')
    EXPECT_EQ(mr.eTVI_HIBYTE              ,  16, 'eTVI_HIBYTE              ')
    EXPECT_EQ(mr.eTVI_LOBYTE              ,  17, 'eTVI_LOBYTE              ')
    EXPECT_EQ(mr.eTVE_HIBYTE              ,  18, 'eTVE_HIBYTE              ')
    EXPECT_EQ(mr.eTVE_LOBYTE              ,  19, 'eTVE_LOBYTE              ')
    EXPECT_EQ(mr.eTVEresp_HIBYTE          ,  20, 'eTVEresp_HIBYTE          ')
    EXPECT_EQ(mr.eTVEresp_LOBYTE          ,  21, 'eTVEresp_LOBYTE          ')
    EXPECT_EQ(mr.eTVEpat_HIBYTE           ,  22, 'eTVEpat_HIBYTE           ')
    EXPECT_EQ(mr.eTVEpat_LOBYTE           ,  23, 'eTVEpat_LOBYTE           ')
    EXPECT_EQ(mr.eHFAmpl_HIBYTE           ,  24, 'eHFAmpl_HIBYTE           ')
    EXPECT_EQ(mr.eHFAmpl_LOBYTE           ,  25, 'eHFAmpl_LOBYTE           ')
    EXPECT_EQ(mr.eTVEHFO_HIBYTE           ,  26, 'eTVEHFO_HIBYTE           ')
    EXPECT_EQ(mr.eTVEHFO_LOBYTE           ,  27, 'eTVEHFO_LOBYTE           ')
    EXPECT_EQ(mr.eDCO2_HIBYTE             ,  28, 'eDCO2_HIBYTE             ')
    EXPECT_EQ(mr.eDCO2_LOBYTE             ,  29, 'eDCO2_LOBYTE             ')
    EXPECT_EQ(mr.eTrigVol_HIBYTE          ,  30, 'eTrigVol_HIBYTE          ')
    EXPECT_EQ(mr.eTrigVol_LOBYTE          ,  31, 'eTrigVol_LOBYTE          ')
    EXPECT_EQ(mr.eITimePSV_HIBYTE         ,  32, 'eITimePSV_HIBYTE         ')
    EXPECT_EQ(mr.eITimePSV_LOBYTE         ,  33, 'eITimePSV_LOBYTE         ')
    EXPECT_EQ(mr.eSPO2_HIBYTE             ,  34, 'eSPO2_HIBYTE             ')
    EXPECT_EQ(mr.eSPO2_LOBYTE             ,  35, 'eSPO2_LOBYTE             ')
    EXPECT_EQ(mr.ePulseRate_HIBYTE        ,  36, 'ePulseRate_HIBYTE        ')
    EXPECT_EQ(mr.ePulseRate_LOBYTE        ,  37, 'ePulseRate_LOBYTE        ')
    EXPECT_EQ(mr.ePerfusionIndex_HIBYTE   ,  38, 'ePerfusionIndex_HIBYTE   ')
    EXPECT_EQ(mr.ePerfusionIndex_LOBYTE   ,  39, 'ePerfusionIndex_LOBYTE   ')
    EXPECT_EQ(mr.eETCO2_HIBYTE            ,  40, 'eETCO2_HIBYTE            ')
    EXPECT_EQ(mr.eETCO2_LOBYTE            ,  41, 'eETCO2_LOBYTE            ')
    EXPECT_EQ(mr.eBPM_HIBYTE              ,  42, 'eBPM_HIBYTE              ')
    EXPECT_EQ(mr.eBPM_LOBYTE              ,  43, 'eBPM_LOBYTE              ')
    EXPECT_EQ(mr.eBPMco2_HIBYTE           ,  44, 'eBPMco2_HIBYTE           ')
    EXPECT_EQ(mr.eBPMco2_LOBYTE           ,  45, 'eBPMco2_LOBYTE           ')
    EXPECT_EQ(mr.eLeak_HIBYTE             ,  46, 'eLeak_HIBYTE             ')
    EXPECT_EQ(mr.eLeak_LOBYTE             ,  47, 'eLeak_LOBYTE             ')
    EXPECT_EQ(mr.eHFFreq_HIBYTE           ,  48, 'eHFFreq_HIBYTE           ')
    EXPECT_EQ(mr.eHFFreq_LOBYTE           ,  49, 'eHFFreq_LOBYTE           ')
    EXPECT_EQ(mr.ePercent_HIBYTE          ,  50, 'ePercent_HIBYTE          ')
    EXPECT_EQ(mr.ePercent_LOBYTE          ,  51, 'ePercent_LOBYTE          ')
    EXPECT_EQ(mr.eOxyVal_HIBYTE           ,  52, 'eOxyVal_HIBYTE           ')
    EXPECT_EQ(mr.eOxyVal_LOBYTE           ,  53, 'eOxyVal_LOBYTE           ')
    EXPECT_EQ(mr.eINSP_FLOW_HIBYTE        ,  54, 'eINSP_FLOW_HIBYTE        ')
    EXPECT_EQ(mr.eINSP_FLOW_LOBYTE        ,  55, 'eINSP_FLOW_LOBYTE        ')
    EXPECT_EQ(mr.eEXP_FLOW_HIBYTE         ,  56, 'eEXP_FLOW_HIBYTE         ')
    EXPECT_EQ(mr.eEXP_FLOW_LOBYTE         ,  57, 'eEXP_FLOW_LOBYTE         ')
    EXPECT_EQ(mr.eDEMAND_FLOW_HIBYTE      ,  58, 'eDEMAND_FLOW_HIBYTE      ')
    EXPECT_EQ(mr.eDEMAND_FLOW_LOBYTE      ,  59, 'eDEMAND_FLOW_LOBYTE      ') 
end

function test_para_get_waveData()
    local wd = FTI.para_get_waveData      -- expected Value
    EXPECT_EQ(wd.eValPressure_HIBYTE,       1,     'eValPressure_HIBYTE')
    EXPECT_EQ(wd.eValPressure_LOBYTE,       2,     'eValPressure_LOBYTE')
    EXPECT_EQ(wd.eValFlow_HIBYTE    ,       3,     'eValFlow_HIBYTE    ')
    EXPECT_EQ(wd.eValFlow_LOBYTE    ,       4,     'eValFlow_LOBYTE    ')
    EXPECT_EQ(wd.eValCO2_HIBYTE     ,       5,     'eValCO2_HIBYTE     ')
    EXPECT_EQ(wd.eValCO2_LOBYTE     ,       6,     'eValCO2_LOBYTE     ')
end

function test_command()
    local cmd = FTI.command                             -- expected Value
    EXPECT_EQ(cmd.TERM_STOP_CONTINIOUS_MEASUREMENTS    ,  0x50,     'TERM_STOP_CONTINIOUS_MEASUREMENTS    ')
    EXPECT_EQ(cmd.TERM_STOP_WAVE_DATA                  ,  0x51,     'TERM_STOP_WAVE_DATA                  ')
    EXPECT_EQ(cmd.TERM_MSG_SOM                         ,  0x02,     'TERM_MSG_SOM                         ')
    EXPECT_EQ(cmd.TERM_PARAM_NOSUPPORT                 ,  0xFD,     'TERM_PARAM_NOSUPPORT                 ')
    EXPECT_EQ(cmd.TERM_PARAM_OUTOFFRANGE               ,  0xFF,     'TERM_PARAM_OUTOFFRANGE               ')
    EXPECT_EQ(cmd.TERM_GET_MEASUREMENTS_ONCE_BTB       ,  0x00,     'TERM_GET_MEASUREMENTS_ONCE_BTB       ')
    EXPECT_EQ(cmd.TERM_GET_MEASUREMENTS_CONTINIOUS_BTB ,  0x01,     'TERM_GET_MEASUREMENTS_CONTINIOUS_BTB ')
    EXPECT_EQ(cmd.TERM_GET_MEASUREMENTS_ONCE_AVG       ,  0x02,     'TERM_GET_MEASUREMENTS_ONCE_AVG       ')
    EXPECT_EQ(cmd.TERM_GET_MEASUREMENTS_CONTINIOUS_AVG ,  0x03,     'TERM_GET_MEASUREMENTS_CONTINIOUS_AVG ')
    EXPECT_EQ(cmd.TERM_MEASUREMENTS_BTB                ,  0x00,     'TERM_MEASUREMENTS_BTB                ')
    EXPECT_EQ(cmd.TERM_MEASUREMENTS_AVG                ,  0x02,     'TERM_MEASUREMENTS_AVG                ')
    EXPECT_EQ(cmd.TERM_GET_WAVE_DATA                   ,  0x04,     'TERM_GET_WAVE_DATA                   ')
    EXPECT_EQ(cmd.TERM_GET_VENT_MODE                   ,  0x05,     'TERM_GET_VENT_MODE                   ')
    EXPECT_EQ(cmd.TERM_GET_MODE_OPTION1                ,  0x06,     'TERM_GET_MODE_OPTION1                ')
    EXPECT_EQ(cmd.TERM_GET_MODE_OPTION2                ,  0x07,     'TERM_GET_MODE_OPTION2                ')
    EXPECT_EQ(cmd.TERM_STOP_CONTINIOUS_MEASUREMENTS    ,  0x50,     'TERM_STOP_CONTINIOUS_MEASUREMENTS    ')
    EXPECT_EQ(cmd.TERM_STOP_WAVE_DATA                  ,  0x51,     'TERM_STOP_WAVE_DATA                  ')
    EXPECT_EQ(cmd.TERM_MEASUREMENTS_BTB                ,  0x00,     'TERM_MEASUREMENTS_BTB                ')
    EXPECT_EQ(cmd.TERM_MEASUREMENTS_AVG                ,  0x02,     'TERM_MEASUREMENTS_AVG                ')
    EXPECT_EQ(cmd.TERM_WAVE_DATA                       ,  0x04,     'TERM_WAVE_DATA                       ')
    EXPECT_EQ(cmd.TERM_VENT_MODE                       ,  0x05,     'TERM_VENT_MODE                       ')
    EXPECT_EQ(cmd.TERM_MODE_OPTION1                    ,  0x06,     'TERM_MODE_OPTION1                    ')
    EXPECT_EQ(cmd.TERM_MODE_OPTION2                    ,  0x07,     'TERM_MODE_OPTION2                    ')
end

----------------------------------------------------------------------------------------
-- Call function tests
----------------------------------------------------------------------------------------
test_VentModeRange()
test_VentModes()
test_ModeOption1()
test_ModeOption2()
test_para_get_VentSettings()
test_para_set_settingData()
test_para_measure_response()
test_para_get_waveData()
test_command()