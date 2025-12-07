extends Node

##buff的显示名字
@export var displayName: String = "未知效果"
##buff的图标路径
@export var buffIconPath: String = ProjectSettings.globalize_path("res://Buff组件/Buff图标/未知.png")
##buff类型[br]
##这个归类请在[负面][中性][正面]里面选一个写。均对于被附着对象[br]
##例如：挂在怪物身上的，当你打它一下，会多扣怪物一点血，那它应当是负面的，即使它对玩家有益
@export var buffType: String = "中性"
##buff分组，这个由你自己写。不要写负面正面中性就行了。[br]
##你也可以不写分组。
@export var group: String = ""
