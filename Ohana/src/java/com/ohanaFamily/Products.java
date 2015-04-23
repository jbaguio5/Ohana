package com.ohanaFamily;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "PRODUCTS", catalog = "", schema = "FAMARCADES")
@NamedQueries({
    @NamedQuery(name = "Products.findAll", query = "SELECT p FROM Products p"),
    @NamedQuery(name = "Products.findByDescription", query = "SELECT p FROM Products p WHERE p.description = :description"),
    @NamedQuery(name = "Products.findByContent", query = "SELECT p FROM Products p WHERE p.content = :content"),
    @NamedQuery(name = "Products.findByPictype", query = "SELECT p FROM Products p WHERE p.pictype = :pictype"),
    @NamedQuery(name = "Products.findById", query = "SELECT p FROM Products p WHERE p.id = :id")})
public class Products implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "DESCRIPTION")
    private String description;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "CONTENT")
    private String content;
    @Lob
    @Column(name = "PICTURE")
    private Serializable picture;
    @Size(max = 20)
    @Column(name = "PICTYPE")
    private String pictype;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;

    public Products() {
    }

    public Products(Integer id) {
        this.id = id;
    }

    public Products(Integer id, String description, String content) {
        this.id = id;
        this.description = description;
        this.content = content;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Serializable getPicture() {
        return picture;
    }

    public void setPicture(Serializable picture) {
        this.picture = picture;
    }

    public String getPictype() {
        return pictype;
    }

    public void setPictype(String pictype) {
        this.pictype = pictype;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Products)) {
            return false;
        }
        Products other = (Products) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ohanaFamily.Products[ id=" + id + " ]";
    }

}
