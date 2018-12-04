# 使用说明：
# 1、创建一个 CHCommands 文件
# 2、需要执行一下：chmod +x CHCommands
# 3、右键 CHCommands，选择打开方式为终端


##########################################################################################################################################
#### 				   Xcode Indexing 设置     				     ####
##########################################################################################################################################

function disable_Xcode_Index() {
	# 1、干掉 Xcode
	killall Xcode
	# 2、禁用 Xcode 建索引
	defaults write com.apple.dt.Xcode IDEIndexDisable 1
	# 3、打开 Xcode
	open /Applications/Xcode.app
	# 4、提示用户操作完成，睡眠 2 秒，然后退出
	echo "\033[32m+++++Xcode 禁用索引成功！🌚😁🌚🙃🌚😅+++++\033[0m"
	sleep 2
	exit
}

function enable_Xcode_Index() {
	# 1、干掉 Xcode
	killall Xcode
	# 2、禁用 Xcode 建索引
	defaults write com.apple.dt.Xcode IDEIndexDisable 0
	# 3、打开 Xcode
	open /Applications/Xcode.app
	# 4、提示用户操作完成，睡眠 2 秒，然后退出
	echo "\033[32m+++++Xcode 启用索引成功！🌚😁🌚🙃🌚😅+++++\033[0m"
	sleep 2
	exit
}

##########################################################################################################################################
#### 				   更新终端terminal环境      				     ####
##########################################################################################################################################

function update_carthage() {
	echo "\n\033[32m——-----【开始执行：brew upgrade carthage】——-----\033[0m\n"
	brew upgrade carthage
	echo "\n\033[32m——-----【brew upgrade carthage 执行完毕】——-----\033[0m\n"
}

function update_fastlane() {
	echo "\n\033[32m——-----【开始执行：bundle update fastlane】——-----\033[0m\n"
	bundle update fastlane
	echo "\n\033[32m——-----【bundle update fastlane 执行完毕】——-----\033[0m\n"

	echo "\n\033[32m——-----【开始执行：sudo gem update fastlane】——-----\033[0m\n"
	sudo gem update fastlane
	echo "\n\033[32m——-----【sudo gem update fastlane 执行完毕】——-----\033[0m\n"
}


function update_terminal_environment() {
	update_fastlane ### fastlane 更新

	update_carthage ### carthage 更新
}


##########################################################################################################################################
#### 				   快速跳转 Finder 目录      				     ####
##########################################################################################################################################


function ch_read_input_and_goTo()
{
	echo "\033[32m——----- 请选择跳转文件夹索引：——--------------------\033[0m"
	echo "\033[32m——----- 1：打开 Xcode DerivedData ----------------\033[0m"
	echo "\033[32m——----- 2：打开 Xcode Archives -------------------\033[0m"
	echo "\033[32m——----- 3：打开 Xcode Templates ——----------------\033[0m"
	echo "\033[32m——----- 4：打开 Xcode CodeSnippets ——-------------\033[0m"
	echo "\033[32m——----- 5：打开 DeviceSupport --------------------\033[0m"
	echo "\033[32m——----- 6：打开 Xcode Provisioning Profiles ------\033[0m"
	echo "\033[32m——----- 7：打开 Xcode FrameWork ——----------------\033[0m"
	echo "\033[32m——----- 8：打开 Xcode DeviceSupport ——------------\033[0m"


	read selectIndex

	if [ $selectIndex -eq 1 ] ### 1：打开 Xcode DerivedData
	then
		open ~/Library/Developer/Xcode/DerivedData
	elif [ $selectIndex -eq 2 ] ### 2：打开 Xcode Archives
	then
		open ~/Library/Developer/Xcode/Archives

	elif [ $selectIndex -eq 3 ] ### 3：打开 Xcode Templates
	then
		open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File\ Templates/Source/GuowenWang.xctemplate

	elif [ $selectIndex -eq 4 ] ### 4：打开 Xcode CodeSnippets
	then
		open ~/Library/Developer/Xcode/UserData/CodeSnippets
	elif [ $selectIndex -eq 5 ] ### 5：打开 Xcode DeviceSupport
	then
		open ~/Library/Developer/Xcode/iOS\ DeviceSupport
	elif [ $selectIndex -eq 6 ] ### 6：打开 Xcode Profiles
	then
		open ~/Library/MobileDevice/
	elif [ $selectIndex -eq 7 ] ### 7：打开 Xcode FrameWork
	then
		open ~/Library/Developer/Xcode/DerivedData/Build/Products
	elif [ $selectIndex -eq 8 ] ### 7：打开 Xcode FrameWork
	then
		open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport
	else
		echo "\033[32m——-----没有需要跳转的文件夹——-----\033[0m"
	fi

	ch_exit
}

function ch_exit()
{
	sleep 3
	exit 1
}

### 方法的调用，不需要在方法后面增加一个括号
ch_read_input_and_goTo
