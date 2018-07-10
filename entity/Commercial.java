package net.sppan.base.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.alibaba.fastjson.annotation.JSONField;

import net.sppan.base.entity.support.BaseEntity;

/**
 * <p>
 * 角色表
 * </p>
 *
 * @author SPPan
 * @since 2016-12-28
 */
@Entity
@Table(name = "ims_commune_commercial")
public class Commercial extends BaseEntity {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * 源id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "commercial_id", nullable = false)
    private Integer commercial_id;

    /**
     * 源类型
     */
    private Integer commercial_type;

    /**
     * 源名称
     */
    private String commercial_name;

    /**
     * 源logo
     */
    private String commercial_picture;

    /**
     * 源名称
     */
    private String commercial_website;


    /**
     * 创建时间
     */
    private Integer createtime;


    public Integer getId() { return commercial_id; }

    public void setId(Integer id) {
        this.commercial_id = id;
    }

    public Integer getType() { return commercial_type; }

    public void setType(Integer id) {
        this.commercial_type = id;
    }

    public String getName() {
        return commercial_name;
    }

    public void setName(String name) {
        this.commercial_name = name;
    }


    public String getPicture() {
        return commercial_picture;
    }

    public void setPicture(String name) {
        this.commercial_picture = name;
    }

    public String getWebsite() {
        return commercial_website;
    }

    public void setWebsite(String name) {
        this.commercial_website = name;
    }

    public Integer getTime() { return createtime; }

    public void setTime(Integer id) {
        this.createtime = id;
    }


}
