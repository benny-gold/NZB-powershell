

New-NZBSettingsObject -inputtype Host -PushAuthToken Blah `
-GeekURL $geekURL `
-GeekKey lksbndkfjbsdbjbdsjbn `
-SabUrl http://localhost:8080 `
-SabKey dsgrhrewhr `
-SonarrURL http://localhost:8989 `
-SonarrKey sdge4w5g4 `
-rootFolderPath C:\Media `
-CouchURL http://localhost:5050 `
-couchKey ygvjhvsdi `
-CouchAPIKey ygvjhvsdi `
-omdbApiKey jkwebjtbnen `
-mailgunKey dnfsndgnoi43387 `
-mailDomain email.com `
-mailRecipient1 "Test@email.com" `
-mailRecipient2 "Test@email.com" `
-TVDBIDKey jbjbn35245 `
-documentDBLocation 'C:\DocumentDB' `
-backupFolder E:\Backups `
-DBLocation C:\DocumentDB `
-slackChannel Piracy -OutFile ./tests/test_settings.json -OutType File