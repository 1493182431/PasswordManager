package com.kalvin.kvf.modules.sys.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.kalvin.kvf.modules.sys.entity.Dict;
import com.kalvin.kvf.modules.sys.mapper.DictMapper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 字典表 服务实现类
 * </p>
 * @since 2024-05-18 12:22:50
 */
@Service
public class DictServiceImpl extends ServiceImpl<DictMapper, Dict> implements DictService {

    @Override
    public Page<Dict> listDictPage(Dict dict) {
        Page<Dict> page = new Page<>(dict.getCurrent(), dict.getSize());
        List<Dict> dicts = baseMapper.selectDictList(dict, page);
        return page.setRecords(dicts);
    }

}
