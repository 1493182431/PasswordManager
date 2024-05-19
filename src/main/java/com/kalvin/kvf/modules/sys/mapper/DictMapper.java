package com.kalvin.kvf.modules.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.kalvin.kvf.modules.sys.entity.Dict;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 字典表 Mapper 接口
 * </p>
 * @since 2024-05-18 12:22:50
 */
public interface DictMapper extends BaseMapper<Dict> {

    /**
     * 查询列表(分页)
     * @param dict 查询参数
     * @param page 分页参数
     * @return list
     */
    List<Dict> selectDictList(@Param("dict") Dict dict, IPage page);

}
