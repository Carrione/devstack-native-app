#!/bin/bash

cd "$(dirname "$0")"

# RocketToolkit
cd ../DataLayer/Toolkits/RocketToolkit
swift package --disable-sandbox --allow-writing-to-package-directory apollo-fetch-schema
swift package --disable-sandbox --allow-writing-to-package-directory apollo-generate
find ./Sources/RocketToolkitMocks -type f -exec sed -i '' -e "s/rocket/Rocket/g" {} +
cd ../../..
