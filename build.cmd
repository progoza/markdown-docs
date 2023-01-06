call jekyll b -s cv -d _output\cv

rmdir _build /s /q
md _build

md _build\cs4kids
xcopy _theme _build\cs4kids /s /e
xcopy cs4kids _build\cs4kids /s /e /y
call jekyll b -s _build\cs4kids -d _output\cs4kids

