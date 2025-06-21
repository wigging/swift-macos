# Compile all the Swift files with `make` or `make compile`
compile:
	swiftc -Xcc -DACCELERATE_NEW_LAPACK -Ounchecked lapack.swift
	swiftc -Ounchecked rand48.swift
	swiftc -Ounchecked random.swift
	swiftc -Ounchecked wyrandom.swift
	swiftc -Ounchecked wyuniform.swift

# Run the 64-bit benchmark using hyperfine with `make benchmark64`
benchmark: compile
	hyperfine --warmup 3 './lapack' './rand48' './random' './wyrandom' './wyuniform'

# Remove all the output files with `make clean`
clean:
	rm -f lapack rand48 random wyrandom wyuniform
