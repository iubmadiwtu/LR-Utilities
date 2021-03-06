/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [StatsMsgSourceCountsID]
      ,[StatDate]
      ,A.Name
      ,B.Name
      ,[CountLogs]
      ,[CountIdentifiedLogs]
      ,[CountArchivedLogs]
      ,[CountEvents]
      ,[CountOnlineLogs]
      ,[CountProcessedLogs]
      ,[CountDeduplicatedLogs]
      ,[CountEventsForwarded]
      ,[EventsRBPSum]
      ,[MonitoredEventsRBPSum]
      ,[CountLogMart]
      ,[CountEventsRBP10]
      ,[CountEventsRBP20]
      ,[CountEventsRBP30]
      ,[CountEventsRBP40]
      ,[CountEventsRBP50]
      ,[CountEventsRBP60]
      ,[CountEventsRBP70]
      ,[CountEventsRBP80]
      ,[CountEventsRBP90]
      ,[CountEventsRBP100]
      ,[CountAnalyzedLogs]
  FROM [LogRhythm_LogMart].[dbo].[StatsMsgSourceCountsMinute]
  INNER JOIN [LogRhythmEMDB].[dbo].[MsgSource] AS A
	ON [LogRhythm_LogMart].[dbo].[StatsMsgSourceCountsMinute].[MsgSourceID] = A.MsgSourceID
  INNER JOIN [LogRhythmEMDB].[dbo].[Mediator] AS B
	ON [LogRhythm_LogMart].[dbo].[StatsMsgSourceCountsMinute].[MediatorID] = B.MediatorID
  WHERE StatDate > DATEADD(minute, -2, GETUTCDATE()) 
  ORDER BY StatsMsgSourceCountsID DESC