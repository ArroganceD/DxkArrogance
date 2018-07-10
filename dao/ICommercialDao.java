package net.sppan.base.dao;

import net.sppan.base.dao.support.IBaseDao;
import net.sppan.base.entity.Commercial;

import org.springframework.stereotype.Repository;

@Repository
public interface ICommercialDao extends IBaseDao<Commercial, Integer> {

    //Commercial findByName(String commercial_name);

}
