#!/bin/bash

git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git &&
    echo "export PATH=$PATH:$HOME/depot_tools" >> ~/.bash_profile && \
    source ~/.bash_profile && \
    mkdir Chromium && cd Chromium && \
    fetch --no-history chromium && \
    cd src && \
    mkdir -p out/Headless && \
    echo 'import("//build/args/headless.gn")' > out/Headless/args.gn && \
    echo 'is_debug = false' >> out/Headless/args.gn && \
    echo 'symbol_level = 0' >> out/Headless/args.gn && \
    echo 'is_component_build = false' >> out/Headless/args.gn && \
    echo 'remove_webcore_debug_symbols = true' >> out/Headless/args.gn && \
    echo 'enable_nacl = false' >> out/Headless/args.gn && \
    gn gen out/Headless && \
    ninja -C out/Headless headless_shell && \
    mkdir out/headless-chrome && \
    cd out && \
    cp Headless/headless_shell Headless/libosmesa.so headless-chrome/ && \
    tar -zcvf chrome-headless-lambda-linux-x64.tar.gz headless-chrome/