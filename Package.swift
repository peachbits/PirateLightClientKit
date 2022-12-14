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
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.0.0"),
        .package(url: "https://github.com/stephencelis/SQLite.swift.git", from: "0.13.0"),
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
