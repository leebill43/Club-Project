

##buff的显示名字
var displayName: String = "未知效果"
##buff的图标路径
var buffIconPath: String = ProjectSettings.globalize_path("res://Buff组件/Buff图标/未知.png")
##buff类型[br]
##这个归类请在[负面][中性][正面]里面选一个写。均对于被附着对象[br]
##例如：挂在怪物身上的，当你打它一下，会多扣怪物一点血，那它应当是负面的，即使它对玩家有益
var buffType: String = "中性"
##buff分组，这个由你自己写。不要写负面正面中性就行了。[br]
##你也可以不写分组。
var group: String = ""
##buff持续时间[br]
##单位：秒[br]
##如果是-1，则表示永久持续[br]
##如果是正数，则表示持续时间[br]
##对于一次性的buff，可以设置成-1，然后在使用完毕后把自己删掉
var duration: float = -1


##初始化该buff时调用
func _init() -> void:
	pass
