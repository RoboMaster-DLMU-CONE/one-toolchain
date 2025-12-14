@echo off

:: ==========================================================
:: One-Framework Toolchain Environment Activator
:: ==========================================================

:: 1. 获取当前脚本所在的根目录 (例如 C:\Users\User\.one-studio\tools\)
:: %~dp0 包含结尾的斜杠 \
set "ONE_ROOT=%~dp0"

echo [OneStudio] Activating toolchain at: %ONE_ROOT%

:: 2. 设置各个工具的路径变量
set "DIR_BIN=%ONE_ROOT%bin"
set "DIR_CMAKE=%ONE_ROOT%cmake\bin"
set "DIR_GIT=%ONE_ROOT%git\cmd"
set "DIR_GPERF=%ONE_ROOT%gperf\bin"
set "DIR_PYTHON=%ONE_ROOT%python"
set "DIR_SCRIPTS=%ONE_ROOT%python\Scripts"
set "ZEPHYR_SDK_INSTALL_DIR=%ONE_ROOT%sdk"
set "ZEPHYR_TOOLCHAIN_VARIANT=zephyr"

:: 3. 拼接 PATH
:: 注意顺序：我们的工具在前，系统原有 PATH (%PATH%) 在最后
set "PATH=%DIR_SCRIPTS%;%DIR_PYTHON%;%DIR_BIN%;%DIR_CMAKE%;%DIR_GIT%;%DIR_GPERF%;%PATH%"

:: 告诉 CMake 使用我们的 Python，防止它去调系统里的 Anaconda/Python3.8
set "PYTHON_EXECUTABLE=%DIR_PYTHON%\python.exe"

:: 4. 验证一下
echo.
echo [Check] Python:
where python
echo [Check] West:
where west
echo [Check] CMake:
where cmake
echo.

echo [Success] Environment is ready! You can run 'west build' now.
