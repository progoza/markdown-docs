call jekyll b -s cv -d .output\cv

rmdir .build /s /q
md .build

md .build\cs4kids
xcopy .theme .build\cs4kids /s /e
xcopy cs4kids .build\cs4kids /s /e /y
call jekyll b -s .build\cs4kids -d .output\cs4kids

