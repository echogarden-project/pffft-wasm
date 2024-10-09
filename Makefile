PROJ=pffft

EMCCFLAGS=-s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -s EXPORTED_FUNCTIONS="['_malloc', '_free', '_pffft_new_setup', '_pffft_destroy_setup', '_pffft_transform', '_pffft_transform_ordered', '_pffft_zreorder', '_pffft_zconvolve_accumulate', '_pffft_aligned_malloc', '_pffft_aligned_free', '_pffft_simd_size']" -s EXPORTED_RUNTIME_METHODS="['getValue', 'setValue', 'cwrap']" -s MODULARIZE=1 -s EXPORT_NAME="PFFFT"

all: src/pffft.c
	emcc $(EMCCFLAGS) -O3 -msimd128 -msse -D__x86_64__=1 -o $(PROJ).cjs -I src $^

.PHONY: clean
clean:
	rm -f $(PROJ).cjs $(PROJ).wasm
