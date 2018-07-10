package net.sppan.base.dao;

import net.sppan.base.dao.support.IBaseDao;
import net.sppan.base.entity.Information;
import org.springframework.stereotype.Repository;

@Repository
public interface IInformationDao extends IBaseDao<Information, Integer> {

    //Commercial findByName(String commercial_name);

}
