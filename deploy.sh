echo "Start"
git add .
git commit -m backup
git checkout br-back1
git cherry-pick master
git push origin br-back
git checkout master
hexo g
hexo d
echo "Finish"
echo 按任意键继续
read -n 1
