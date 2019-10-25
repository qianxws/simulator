var biz = {
    //列表
    getList: function (page) {
        vmCheckUtil.clearChecked();
        JqdeBox.loading();
        page = page || 1;
        var rows = $('#pageSelect').val();
        JqdeMods.ajax('simDeviceDependencyAction', 'getList', {
            'page': page,
            'rows': rows,
            'name': vm.model.name,
            'code': vm.model.code,
            'dependencyId': vm.model.dependencyId,
            'simulatorId': vm.model.nodeId,
        }).then(function (result) {
            JqdeBox.unloading();
            if (result) {
                vm.list = result.list;
                vmPageUtil.show(page, result.total, 'biz.getList', rows);
            } else {
                JqdeBox.message(false, result.message);
            }
        });
    },
    // 添加
    add: function () {
        BootDialog.dialog({
            title: '添加依赖关系设置',
            url: 'modules/simdevicedependency/edit.html',
            init: function () {
                vmEdit.init();
            },
            confirm: function () {
                if ($(vmEdit.formId).valid()) {
                    JqdeMods.ajax('simDeviceDependencyAction', 'insert', {dataItem: vmEdit.model}).then(function (result) {
                        if (result.success) {
                            biz.getList();// 更新页面
                            JqdeBox.message(true, result.message);
                        } else {
                            JqdeBox.message(false, result.message);
                        }
                    });
                    return true;
                }
                return false;
            }
        });
    },
    //更新
    edit: function (item) {
        BootDialog.dialog({
            title: '修改<b class="green">[' + item.sysName + ']</b>依赖关系设置',
            url: 'modules/simdevicedependency/edit.html',
            init: function () {
                JqdeMods.ajax('simDeviceDependencyAction', 'getDetail', {
                    'deviceDependencyId': item.deviceDependencyId,
                }).then(function (result) {
                    if (result.success) {
                        vmEdit.model = $.extend(vmEdit.model, result.model);
                        vmEdit.init();
                    } else {
                        JqdeBox.message(false, result.message);
                    }
                });
            },
            confirm: function () {
                if ($(vmEdit.formId).valid()) {
                    JqdeMods.ajax('simDeviceDependencyAction', 'update', {dataItem: vmEdit.model}).then(function (result) {
                        if (result.success) {
                            biz.getList();// 更新页面
                            JqdeBox.message(true, result.message);
                        } else {
                            JqdeBox.message(false, result.message);
                        }
                    });
                    return true;
                }
                return false;
            }
        });
    },
    // 删除
    del: function (item) {
        JqdeBox.confirm('您确定要删除依赖关系设置[<b class="green">' + item.name + '</b>] 吗？', function (result) {
            if (result) {
                JqdeMods.ajax('simDeviceDependencyAction', 'delete', {"ids": [item.deviceDependencyId]}).then(function (result) {
                    if (result) {
                        biz.getList();// 更新页面
                        JqdeBox.message(true, result.message);
                    } else {
                        JqdeBox.message(false, result.message);
                    }
                });
            }
        });
    },
    // 删除选中
    delSelected: function () {
        JqdeBox.confirm('您确定要删除依赖关系设置吗？', function (result) {
            if (result) {
                JqdeMods.ajax('simDeviceDependencyAction', 'delete', {"ids": vm.ids}).then(function (result) {
                    if (result) {
                        biz.getList();// 更新页面
                        JqdeBox.message(true, result.message);
                    } else {
                        JqdeBox.message(false, result.message);
                    }
                });
            }
        });
    },
    // 获取依赖关系列表
    getDependencyList: function () {
        JqdeMods.ajax('simDependencyAction', 'getList', {}).then(function (result) {
            if (result) {
                try {
                    vmEdit.dependencys = result.list;
                } catch (e) {
                    vm.dependencys = result.list;
                }
            }
        });
    },
    // 验证表单
    setValid: function () {
        $(vmEdit.formId).validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: true,
            ignore: "",
            rules: {
                name: {required: true},
            },
            messages: {
                name: {required: "名称不能为空"},
            },
            highlight: function (e) {
                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
            },
            success: function (e) {
                $(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
                $(e).remove();
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
            }
        });
    },
}