# PFFFT (WASM port)

[PFFFT FFT library](https://bitbucket.org/jpommier/pffft), compiled to WASM.

Intended for use with [Echogarden](https://github.com/echogarden-project/echogarden).

## How to build

Clone the EMSDK repository:
```
git clone https://github.com/emscripten-core/emsdk
```

Install and activate EMSDK:
```
cd emsdk
git pull
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh
cd ..
```

Clone repository:
```
git clone https://github.com/echogarden-project/pffft-wasm
cd pffft-wasm
```

Build with WASM SIMD disabled:
```
make
```

Build with WASM SIMD enabled:
```
make SIMD=1
```
