@ECHO OFF

CLS

FOR /D /r %%G in ("clusters\groups\*") DO (
    ECHO Infrastructure detected: %%~nxG 
    FOR /D /r %%F in ("clusters\groups\%%~nxG\*") DO (
        ECHO %%~nxG.%%~nxF cluster was found.
        FOR /D /r %%E in ("clusters\groups\%%~nxG\%%~nxF\overlays\*") DO (
            ECHO %%~nxG.%%~nxF.%%~nxE namespace was found.
            ECHO Rendered manifest generated: clusters\groups\%%~nxG\%%~nxF\overlays\%%~nxE\rendered\manifest.yaml
            mkdir clusters\groups\%%~nxG\%%~nxF\overlays\%%~nxE\rendered
            kubectl kustomize clusters\groups\%%~nxG\%%~nxF\overlays\%%~nxE --enable-helm --load-restrictor LoadRestrictionsNone > clusters\groups\%%~nxG\%%~nxF\overlays\%%~nxE\rendered\manifest.yaml
        )
    )
)