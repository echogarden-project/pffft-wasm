PROJ=pffft

SIMD=0

ifeq ($(SIMD), 1)
	SIMD_FLAGS=-msimd128 -msse -D __x86_64__=1
	OUT_FILE_PATH=dist/simd/$(PROJ).js
else
	SIMD_FLAGS=-D PFFFT_SIMD_DISABLE=1
	OUT_FILE_PATH=dist/non-simd/$(PROJ).js
endif

EMCCFLAGS=-s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -s EXPORTED_FUNCTIONS="['_malloc', '_free', '_pffft_new_setup', '_pffft_destroy_setup', '_pffft_transform', '_pffft_transform_ordered', '_pffft_zreorder', '_pffft_zconvolve_accumulate', '_pffft_aligned_malloc', '_pffft_aligned_free', '_pffft_simd_size']" -s EXPORTED_RUNTIME_METHODS="['getValue', 'setValue', 'cwrap']" -s MODULARIZE=1 -s EXPORT_ES6=1 -s EXPORT_NAME="PFFFT"

all: src/pffft.c
	emcc $(EMCCFLAGS) -O3 $(SIMD_FLAGS) -o ${OUT_FILE_PATH} -I src $^

.PHONY: clean
clean:
	rm -f dist/simd/*.* dist/non-simd/*.*
