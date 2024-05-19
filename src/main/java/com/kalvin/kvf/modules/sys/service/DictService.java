package com.kalvin.kvf.modules.sys.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.kalvin.kvf.modules.sys.entity.Dict;

/**
 * <p>
 * 字典表 服务类
 * </p>
 * @since 2024-05-18 12:22:50
 */
public interface DictService extends IService<Dict> {

    /**
     * 获取列表。分页
     * @param dict 查询参数
     * @return page
     */
    Page<Dict> listDictPage(Dict dict);

}
