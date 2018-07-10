package net.sppan.base.service.impl;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import net.sppan.base.common.utils.MD5Utils;
import net.sppan.base.dao.ICommercialDao;
import net.sppan.base.dao.support.IBaseDao;
import net.sppan.base.entity.Commercial;
import net.sppan.base.service.ICommercialService;
import net.sppan.base.service.support.impl.BaseServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

/**
 * <p>
 * 用户账户表  服务实现类
 * </p>
 *
 * @author SPPan
 * @since 2016-12-28
 */
@Service
public class CommercialServiceImpl extends BaseServiceImpl<Commercial, Integer> implements ICommercialService {

    @Autowired
    private ICommercialDao commercialDao;


    @Override
    public IBaseDao<Commercial, Integer> getBaseDao() {
        return this.commercialDao;
    }

//    @Override
//    public Commercial findByName(String username) {
//        return commercialDao.findByName(username);
//    }

    @Override
    public void saveOrUpdate(Commercial commercial) {
        if(commercial.getId() != null){
            Commercial dbcmmercial = find(commercial.getId());
            dbcmmercial.setName(commercial.getName());
            dbcmmercial.setPicture(commercial.getPicture());
            dbcmmercial.setType(commercial.getType());
            dbcmmercial.setWebsite(commercial.getWebsite());
            dbcmmercial.setTime(commercial.getTime());
            update(dbcmmercial);
        }else{
            commercial.setType(commercial.getType());
            commercial.setName(commercial.getName());
            commercial.setPicture(commercial.getPicture());
            commercial.setType(commercial.getType());
            commercial.setWebsite(commercial.getWebsite());
            //commercial.setTime((int)System.currentTimeMillis());
            save(commercial);
        }
    }



    @Override
    public void delete(Integer id) {
        //Commercial commercial = find(id);
        super.delete(id);
    }

}
