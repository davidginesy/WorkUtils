$repertoires = (Get-ChildItem -Directory).FullName

foreach ($repertoire in $repertoires)

{

                if (Test-Path -Path $("$repertoire"+"\.git"))

                {

                               Write-Host "Faire le ménage du référentiel $repertoire"

 

                               git -C $repertoire fetch --prune

 

                               $branchesASupprimer = git -C $repertoire branch --merged | ForEach-Object{$_.trim()} | Where-Object{$_ -notmatch 'master' -and $_ -notmatch 'main'}                             

                              

                               foreach ($branche in $branchesASupprimer)

                               {

                                              

                                               Write-Host "Supprimer la branche $branche dans du référentiel $repertoire"

                                               git -C $repertoire branch -d $branche.trim()

                               }

                }

}