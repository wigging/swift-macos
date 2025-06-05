echo '\n--- Compile ---'

swiftc -Xcc -DACCELERATE_NEW_LAPACK -Ounchecked lapack.swift
swiftc -Ounchecked rand.swift
swiftc -Ounchecked rand48.swift
swiftc -Ounchecked wyrand.swift
swiftc -Ounchecked wyuniform.swift

echo '\n--- Benchmark ---\n'

hyperfine --warmup 3 './lapack' './rand' './rand48' './wyrand' './wyuniform'

echo '\n--- Done ---'
