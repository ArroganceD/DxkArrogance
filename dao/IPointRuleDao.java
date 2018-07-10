package net.sppan.base.dao;

import net.sppan.base.dao.support.IBaseDao;
import net.sppan.base.entity.PointRule;
import org.springframework.stereotype.Repository;

@Repository
public interface IPointRuleDao extends IBaseDao<PointRule, Integer> {

    //Commercial findByName(String commercial_name);

}
