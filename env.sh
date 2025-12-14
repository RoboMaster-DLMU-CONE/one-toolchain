#!/usr/bin/env bash
# shellcheck disable=SC2034

script_dir="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export ONE_ROOT="$script_dir"
export ZEPHYR_TOOLCHAIN_VARIANT="zephyr"
export ZEPHYR_SDK_INSTALL_DIR="$ONE_ROOT/sdk"

echo "[OneStudio] ONE_ROOT set to: $ONE_ROOT"
echo "[OneStudio] ZEPHYR_TOOLCHAIN_VARIANT=$ZEPHYR_TOOLCHAIN_VARIANT"
echo "[OneStudio] ZEPHYR_SDK_INSTALL_DIR=$ZEPHYR_SDK_INSTALL_DIR"
echo "Source this script (e.g. '. env.sh') so the environment persists in your shell."
