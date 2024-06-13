package com.kalvin.kvf.modules.sys.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.kalvin.kvf.common.controller.BaseController;
import com.kalvin.kvf.common.dto.R;
import com.kalvin.kvf.common.utils.AES;
import com.kalvin.kvf.modules.sys.entity.Dict;
import com.kalvin.kvf.modules.sys.service.DictService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


/**
 * <p>
 * 密码表 前端控制器
 * </p>
 *
 * @since 2024-05-18 12:22:50
 */
@RestController
@RequestMapping("sys/dict")
public class DictController extends BaseController {

    @Autowired
    private DictService dictService;

    @RequiresPermissions("sys:dict:index")
    @GetMapping("index")
    public ModelAndView index() {
        return new ModelAndView("sys/dict");
    }

    @GetMapping(value = "edit")
    public ModelAndView edit(Long id) {
        ModelAndView mv = new ModelAndView("sys/dict_edit");
        Dict dict;
        if (id == null) {
            dict = new Dict();
        } else {
            dict = dictService.getById(id);
        }
        mv.addObject("editInfo", dict);
        return mv;
    }

    @GetMapping(value = "list/data")
    public R listData(Dict dict) {
        Page<Dict> page = dictService.listDictPage(dict);
        return R.ok(page);
    }


    @RequiresPermissions("sys:dict:del")
    @PostMapping(value = "batchdel")
    public R batchdel(@RequestParam("ids") List<Long> ids) {
        dictService.removeByIds(ids);
        return R.ok();
    }

    @RequiresPermissions("sys:dict:add")
    @PostMapping(value = "add")
    public R add(Dict dict) throws Exception {
        String key = AES.SHA256(AES.getMacList().toString()+dict.getName() + dict.getCode() + dict.getSort());
        dict.setValue(AES.encryption(key, dict.getValue()));
        dictService.save(dict);
        return R.ok();
    }

    @RequiresPermissions("sys:dict:edit")
    @PostMapping(value = "edit")
    public R edit(Dict dict) throws Exception {
        // 密码已修改
        if (!dict.getValue().equals(dictService.getById(dict.getId()).getValue())) {
            String key = AES.SHA256(AES.getMacList().toString()+dict.getName() + dict.getCode() + dict.getSort());
            dict.setValue(AES.encryption(key, dict.getValue()));
            dictService.updateById(dict);
            return R.ok();
        } else {
            // 密码未改，修改其他信息
            Dict old = dictService.getById(dict.getId());
            String decryption = AES.decryption(AES.SHA256(AES.getMacList().toString()+old.getName()
                    + old.getCode() + old.getSort()), old.getValue());
            String key = AES.SHA256(AES.getMacList().toString()+dict.getName() + dict.getCode() + dict.getSort());
            dict.setValue(AES.encryption(key, decryption));
            dictService.updateById(dict);
            return R.ok();
        }
    }

    @RequiresPermissions("sys:dict:del")
    @PostMapping(value = "del/{id}")
    public R del(@PathVariable Long id) throws Exception {
        if (id < 0) {
            id *= -1;
            dictService.removeById(id);
            return R.ok();
        } else {
            Dict dict = dictService.getById(id);
            String decryption = AES.decryption(AES.SHA256(AES.getMacList().toString()+
                    dict.getName() + dict.getCode() + dict.getSort()), dict.getValue());
            return R.ok(decryption);
        }
    }

    @GetMapping(value = "get/{id}")
    public R get(@PathVariable Long id) {
        return R.ok(dictService.getById(id));
    }

}

