# env.ps1
$ONE_ROOT = $PSScriptRoot
Write-Host "[OneStudio] Activating toolchain at: $ONE_ROOT" -ForegroundColor Cyan

$DIR_BIN = Join-Path $ONE_ROOT "bin"
$DIR_CMAKE = Join-Path $ONE_ROOT "cmake\bin"
$DIR_GIT = Join-Path $ONE_ROOT "mingit\cmd"
$DIR_GPERF = Join-Path $ONE_ROOT "gperf\bin"
$DIR_PYTHON = Join-Path $ONE_ROOT "python"
$DIR_SCRIPTS = Join-Path $ONE_ROOT "python\Scripts"

# Zephyr SDK Setup
$SDK_ROOT = Join-Path $ONE_ROOT "sdk"
# Try to find the actual SDK directory (e.g. zephyr-sdk-0.17.4) inside sdk/
$ZEPHYR_SDK_DIR = Get-ChildItem -Path $SDK_ROOT -Directory -Filter "zephyr-sdk-*" | Select-Object -ExpandProperty FullName -First 1
if (-not $ZEPHYR_SDK_DIR) {
    $ZEPHYR_SDK_DIR = $SDK_ROOT
}
$env:ZEPHYR_SDK_INSTALL_DIR = $ZEPHYR_SDK_DIR
$env:ZEPHYR_TOOLCHAIN_VARIANT = "zephyr"

$env:PYTHON_EXECUTABLE = Join-Path $DIR_PYTHON "python.exe"

$NewPath = "$DIR_SCRIPTS;$DIR_PYTHON;$DIR_BIN;$DIR_CMAKE;$DIR_GIT;$DIR_GPERF"
$env:PATH = "$NewPath;$env:PATH"

Write-Host "[Check] Python:"
Get-Command python -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source
Write-Host "[Check] West:"
Get-Command west -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source
Write-Host "[Check] CMake:"
Get-Command cmake -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source

Write-Host "[Success] Environment activated!" -ForegroundColor Green
