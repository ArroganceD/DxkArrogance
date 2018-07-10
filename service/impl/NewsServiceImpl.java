package net.sppan.base.service.impl;

import net.sppan.base.dao.IInformationDao;
import net.sppan.base.dao.INewsDao;
import net.sppan.base.dao.support.IBaseDao;
import net.sppan.base.entity.News;
import net.sppan.base.service.INewsService;
import net.sppan.base.service.support.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户账户表  服务实现类
 * </p>
 *
 * @author SPPan
 * @since 2016-12-28
 */
@Service
public class NewsServiceImpl extends BaseServiceImpl<News, Integer> implements INewsService {

    @Autowired
    private INewsDao newsDao;


    @Override
    public IBaseDao<News, Integer> getBaseDao() {
        return this.newsDao;
    }

//    @Override
//    public Commercial findByName(String username) {
//        return commercialDao.findByName(username);
//    }

    @Override
    public void saveOrUpdate(News news) {
        if(news.getNews_id() != null){
            News dbnews = find(news.getNews_id());
            dbnews.setCommercial_id(news.getCommercial_id());
            dbnews.setNews_title(news.getNews_title());
            dbnews.setNews_content(news.getNews_content());
            dbnews.setNews_picture(news.getNews_picture());
            dbnews.setOrigin(news.getOrigin());
            dbnews.setComment_count(news.getComment_count());
            dbnews.setBad_count(news.getBad_count());
            dbnews.setGood_count(news.getGood_count());
            //dbnews.setDelete_flag(news.getDelete_flag());
            //dbnews.setCreatetime(news.getCreatetime());
            update(dbnews);
        }else{
            news.setCommercial_id(news.getCommercial_id());
            news.setNews_title(news.getNews_title());
            news.setNews_content(news.getNews_content());
            news.setNews_picture(news.getNews_picture());
            news.setOrigin(news.getOrigin());
            news.setComment_count(news.getComment_count());
            news.setBad_count(news.getBad_count());
            news.setGood_count(news.getGood_count());
            news.setDelete_flag(0);
            news.setCreatetime((int)System.currentTimeMillis());
            save(news);
        }
    }



    @Override
    public void delete(Integer id) {
        //Commercial commercial = find(id);
        super.delete(id);
    }

}
