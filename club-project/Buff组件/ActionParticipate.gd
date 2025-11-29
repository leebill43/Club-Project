class_name ActionParticipate

## 用于存储所有会参与到行为中的函数
var functionList: Array[Callable] = []


## 用于向[member functionList]里面添加函数
func AddFunction(function: Callable) -> void:
	if function.is_null():
		return
	if function in functionList:
		return
	functionList.append(function)
	return
## 用于从[member functionList]里面删除函数
##@experimental: 这个函数可能会有性能问题，所以未来可能会修改
func RemoveFunction(function: Callable) -> void:
	if function.is_null():
		return
	if function not in functionList:
		return
	functionList.erase(function)
	return

func Run(vararg args: Variant) -> void:
	for function in functionList:
		if function.is_null():
			functionList.erase(function)
			continue
		function.call(args)
	return