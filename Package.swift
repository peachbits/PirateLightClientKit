// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "PirateLightClientKit",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_12)
    ],
    products: [
        .library(
            name: "PirateLightClientKit",
            targets: ["PirateLightClientKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/grpc/grpc-swift.git", revision: "9e464a75079928366aa7041769a271fac89271bf"),
        .package(url: "https://github.com/stephencelis/SQLite.swift.git", revision: "9af51e2edf491c0ea632e369a6566e09b65aa333"),
        .package(name:"libpiratelc", url: "https://github.com/piratenetwork/pirate-light-client-ffi.git", from:"0.0.5"),
    ],
    targets: [
        .target(
            name: "PirateLightClientKit",
            dependencies: [
                .product(name: "SQLite", package: "SQLite.swift"),
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "libpiratelc", package: "libpiratelc"),
            ],
            exclude: [
                "Service/ProtoBuf/proto/compact_formats.proto",
                "Service/ProtoBuf/proto/service.proto"
            ],
            resources: [
                .copy("Resources/piratesaplingtree-checkpoints")
            ]
        ),
        .target(
            name: "TestUtils",
            dependencies: ["PirateLightClientKit"],
            path: "Tests/TestUtils",
            exclude: [
                "proto/darkside.proto"
            ],
            resources: [
                .copy("test_data.db"),
                .copy("cache.db"),
                .copy("PirateSdk_Data.db"),
            ]
        ),
        .testTarget(
            name: "OfflineTests",
            dependencies: ["PirateLightClientKit", "TestUtils"]
        ),
        .testTarget(
            name: "NetworkTests",
            dependencies: ["PirateLightClientKit", "TestUtils"]
        ),
        .testTarget(
            name: "DarksideTests",
            dependencies: ["PirateLightClientKit", "TestUtils"]
        )
    ]
)
