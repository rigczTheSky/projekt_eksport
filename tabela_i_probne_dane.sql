USE [nazwa_bazy]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[exports](
    [export_ID] [int] IDENTITY(1,1) NOT NULL,
    [export_name] [varchar](20) NULL,
    [export_dt] [datetime] NULL,
    [export_creator] [varchar](20) NULL,
    [local_name] [varchar](20) NULL,
    PRIMARY KEY CLUSTERED ([export_ID] ASC)
) ON [PRIMARY]
GO

INSERT INTO [dbo].[exports] (export_name, export_dt, export_creator, local_name) VALUES
('Eksport A', '2025-04-01 09:15:00', 'Jan Kowalski', 'Warszawa'),
('Eksport B', '2025-04-02 14:30:00', 'Anna Nowak', 'Kraków'),
('Eksport C', '2025-04-03 11:45:00', 'Piotr Wiœniewski', 'Warszawa'),
('Eksport D', '2025-04-04 16:00:00', 'Katarzyna Wójcik', 'Wroc³aw'),
('Eksport E', '2025-04-05 08:20:00', 'Tomasz Kowalczyk', 'Kraków'),
('Eksport F', '2025-04-06 13:10:00', 'Magdalena Mazur', 'Gdañsk'),
('Eksport G', '2025-04-07 10:50:00', 'Andrzej Kaczmarek', 'Wroc³aw'),
('Eksport H', '2025-04-08 15:35:00', 'Barbara Zieliñska', 'Warszawa'),
('Eksport I', '2025-04-09 09:05:00', 'Micha³ Szymañski', 'Gdañsk'),
('Eksport J', '2025-04-10 14:55:00', 'Ewa Paw³owska', 'Kraków');
GO




