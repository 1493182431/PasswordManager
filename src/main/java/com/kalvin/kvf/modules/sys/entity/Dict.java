package com.kalvin.kvf.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.kalvin.kvf.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 字典表
 * </p>
 * @since 2024-05-18 12:22:50
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_dict")
public class Dict extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 网址名称
     */
    private String name;

    /**
     * 账号
     */
    private String code;

    /**
     * 密码
     */
    private String value;

    /**
     * 状态。0：有效；1：无效
     */
    private Integer status;

    /**
     * 排序值。越小越靠前
     */
    private Integer sort;

    /**
     * 备注
     */
    private String remark;

}
