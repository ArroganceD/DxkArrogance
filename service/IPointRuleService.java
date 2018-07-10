package net.sppan.base.service;

import net.sppan.base.entity.PointRule;
import net.sppan.base.service.support.IBaseService;

/**
 * <p>
 * 用户服务类
 * </p>
 *
 * @author SPPan
 * @since 2016-12-28
 */
public interface IPointRuleService extends IBaseService<PointRule, Integer> {

    /**
     * 根据用户名查找用户
     * @param
     * @return
     */
    //Commercial findByName(String commercial_name);

    /**
     * 增加或者修改用户
     * @param pointRule
     */
    void saveOrUpdate(PointRule pointRule);


}
