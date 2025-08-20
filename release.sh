DATE=$(date +%Y%m%d%H%M%S)
echo "sed -i '1iversion = v1.0.$DATE' ./version.conf"
sed -i "1iversion = v1.0.$DATE" ./version.conf
echo "git commit -a -m '第v1.0.$DATE版本'"
git commit -a -m "第v1.0.$DATE版本"
echo "git checkout -b release/v1.0.$DATE"
git checkout -b release/v1.0.$DATE
echo "git push -u origin release/v1.0.$DATE"
git push -u origin release/v1.0.$DATE
echo "git tag v1.0.$DATE"
git tag v1.0.$DATE
echo "git push --tags"
git push --tags
git checkout master
echo "git checkout master"
echo "goreleaser release --snapshot --clean"
goreleaser release --snapshot --clean
sed -i "1d" ./version.conf
echo "sed -i '1d' ./version.conf"
