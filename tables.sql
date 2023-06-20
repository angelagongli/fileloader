CREATE TABLE dbo.ExampleDestination (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    This NVARCHAR(200) UNIQUE NOT NULL,
    Destination DECIMAL UNIQUE NOT NULL,
    DBTable NVARCHAR(200),
    Was NVARCHAR(200),
    JustAnExample NVARCHAR(200)
);

CREATE TABLE dbo.ThisOldTable (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    This NVARCHAR(200) UNIQUE NOT NULL,
    Old DECIMAL,
    Legacy NVARCHAR(200),
    DBTable NVARCHAR(200),
    HasNoSource NVARCHAR(200),
    Therefore NVARCHAR(200),
    NeedsManualUpdating NVARCHAR(200)
);

CREATE TABLE dbo.ThisNewTable (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    This NVARCHAR(200) UNIQUE NOT NULL,
    New DECIMAL UNIQUE NOT NULL,
    DBTable NVARCHAR(200),
    Expects NVARCHAR(200),
    FileId INT NOT NULL FOREIGN KEY REFERENCES dbo.FileLoadLog (Id),
    RowNumber INT NOT NULL
);

CREATE TABLE dbo.FileLoadLog (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    FileName NVARCHAR(200) NOT NULL,
    FileLength INT NOT NULL,
    Source NVARCHAR(200),
    Destination NVARCHAR(200),
    LoadType TINYINT DEFAULT 0,
    -- 0. Creating, 1. Updating or 2. Replacing
    -- In the real world, what would these different modes/types of loads have been good for?
    -- Restatement/Revision [Replacing], New Partial Updates [Updating], or suppose there was even going to be a never before seen file to get processed [Creating]
    LoadTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
