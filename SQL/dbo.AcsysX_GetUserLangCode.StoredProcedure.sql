/****** Object: StoredProcedure [dbo].[AcsysX_GetUserLangCode] Script Date: 07/08/2024 19:40:43 ******/

IF EXISTS (
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[AcsysX_GetUserLangCode]')
      AND type IN (N'P', N'PC')
)
    DROP PROCEDURE [dbo].[AcsysX_GetUserLangCode];
GO

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

IF NOT EXISTS (
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[AcsysX_GetUserLangCode]')
      AND type IN (N'P', N'PC')
)
BEGIN
    EXEC dbo.sp_executesql @statement = N'
        -- =============================================
        -- Author:      Suresh
        -- Create date: 07/08/2024
        -- Description: To get user language short name
        -- EXEC AcsysX_GetUserLangCode ''System''
        -- =============================================
        CREATE PROCEDURE [dbo].[AcsysX_GetUserLangCode]
            @UserName VARCHAR(100)
        WITH ENCRYPTION
        AS
        BEGIN TRY
            BEGIN
                DECLARE @ShorName VARCHAR(10);

                SELECT @ShorName = ShortName
                FROM AcsysX_Language
                WHERE Id = (
                    SELECT [PreferredLanguage]
                    FROM [AcsysX_Accounts]
                    WHERE FName = @UserName
                );

                IF @ShorName IS NULL
                BEGIN
                    SELECT @ShorName = ShortName
                    FROM AcsysX_Language
                    WHERE LanguageName = (
                        SELECT [value]
                        FROM settings
                        WHERE [name] = '''DefaultLanguage''
                    );
                END

                SELECT @ShorName AS LangCode;
            END
        END TRY
        BEGIN CATCH
            EXEC dbo.[AcsysX_WriteErrorLog] ''AcsysX_GetUserLangCode'';
        END CATCH
    ';
END;
GO
