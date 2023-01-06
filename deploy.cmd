SET HTTP_REPO="..\progoza.github.io"
rmdir %HTTP_REPO%\cv /s /q
md %HTTP_REPO%\cv
xcopy _output\cv %HTTP_REPO%\cv /s /e
rmdir %HTTP_REPO%\cs4kids /s /q
md %HTTP_REPO%\cs4kids
xcopy _output\cs4kids %HTTP_REPO%\cs4kids /s /e
