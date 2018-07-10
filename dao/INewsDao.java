package net.sppan.base.dao;

import net.sppan.base.dao.support.IBaseDao;
import net.sppan.base.entity.News;
import org.springframework.stereotype.Repository;

@Repository
public interface INewsDao extends IBaseDao<News, Integer> {

    //Commercial findByName(String commercial_name);

}
