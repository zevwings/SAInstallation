#!/bin/sh  

echo "Please input project name: "  
read PROJECT_NAME  

echo "Please input github homepage url: "  
read GIT_HOMEPAGE_URL

echo "Please input github ssh url: "  
read GIT_SSH_URL

mkdir "$PROJECT_NAME" && cd "$PROJECT_NAME"

fastlane_dir="`pwd`/fastlane"
if [ ! -d "$fastlane_dir" ];then
mkdir $fastlane_dir
echo "创建文件夹成功"
else
echo "文件夹已经存在"
fi

echo "开始写入Fastfile..."

cat > "${fastlane_dir}/Fastfile" <<EOF
default_platform(:ios)
import_from_git(url: 'git@github.com:zevwings/SAConfiguration.git', branch: 'master', cache_path: '~/.sa/fastlane/cache')

platform :ios do

  desc "自定义脚本"
  lane :custom_lane do |options|

  end
end

EOF

echo "写入Fastfile成功"

echo "开始执行 fastlane 命令 ..."
fastlane install project_name:"$PROJECT_NAME" git_ssh_url:"$GIT_SSH_URL" git_homepage_url:"$GIT_HOMEPAGE_URL"

