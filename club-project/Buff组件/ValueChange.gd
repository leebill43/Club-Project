##这个类将会用于实现Buff中修改数值的方法[br]
##服务于[res://Buff组件/Buff.gd]
class_name ValueChange

## 用于存储所有会修改数值的函数
var functionList: Array[Callable] = []
## 用于获取原始数值的函数
var getOriginalValue: Callable
## 用于设置修改后的数值的函数
var setModifiedValue: Callable

## 用于向[member functionList]里面添加函数
func AddFunction(function: Callable) -> void:
	if function == null:
		return
	if function in functionList:
		return
	functionList.append(function)
	## 每次添加函数都要更新一下数值
	UpdateValue()
	return

##更新数值[br]
##这个函数是类自己调用的，所以你们不用知道它咋用[br]
func UpdateValue() -> void:
	##先判断一下是不是空的，但好像没啥用，不知道为什么判断不出来
	if getOriginalValue == null or setModifiedValue == null:
		print("getOriginalValue 或 setModifiedValue 是空的。\n 对应的组件被删掉了？")
		print(self)
		return
	## 先获取原始数值
	var originalValue = getOriginalValue.call()
	## 然后依次调用所有函数，修改原始数值
	for function in functionList:
		## 每次调用函数都要判断一下，把空的函数给去掉
		if function == null:
			functionList.erase(function)
			continue
		originalValue = function.call(originalValue)
	## 最后设置修改后的数值
	setModifiedValue.call(originalValue)







## 初始化函数[br]
## 用于初始化[member getOriginalValue]和[member setModifiedValue][br]
## [param p_getOriginalValue] 用于获取原始数值的函数[br]
## [param p_setModifiedValue] 用于设置修改后的数值的函数[br]
func _init(p_getOriginalValue: Callable, p_setModifiedValue: Callable) -> void:
	self.getOriginalValue = p_getOriginalValue
	self.setModifiedValue = p_setModifiedValue