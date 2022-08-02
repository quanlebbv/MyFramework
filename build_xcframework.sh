version=$(node -p "require('../package.json').version") 
echo "current version is ${version}."

major=0
minor=0
build=0

# break down the version number into it's components
regex="([0-9]+).([0-9]+).([0-9]+)"
if [[ $version =~ $regex ]]; then
  major="${BASH_REMATCH[1]}"
  minor="${BASH_REMATCH[2]}"
  build="${BASH_REMATCH[3]}"
  build=$(echo $build + 1 | bc)
fi

newVersion=${major}.${minor}.${build}

sed -i '' "s/${version}/${newVersion}/" ../package.json
sed -i '' "s/'${version}'/'${newVersion}'/" ../my-framework.podspec
cat ../package.json

rm -rf ../MyFramework.xcframework

xcodebuild archive \
  -scheme MyFramework \
  -sdk iphoneos \
  -archivePath "archives/ios_devices.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO
  
xcodebuild archive \
  -scheme MyFramework \
  -sdk iphonesimulator \
  -archivePath "archives/ios_simulators.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

xcodebuild -create-xcframework \
    -framework archives/ios_devices.xcarchive/Products/Library/Frameworks/MyFramework.framework \
   -framework archives/ios_simulators.xcarchive/Products/Library/Frameworks/MyFramework.framework \
  -output ../MyFramework.xcframework

# remove unused
rm -rf ./archives/**.xcarchive
