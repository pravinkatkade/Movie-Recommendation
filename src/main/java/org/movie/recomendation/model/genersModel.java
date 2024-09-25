package org.movie.recomendation.model;

public class genersModel {

    private Integer gid; // Changed from int to Integer
    private String gname;

    
    public genersModel() {
	}
    
    public genersModel(String gname) {
	
    
    this.gname=gname;
    }
    
    // Getters and Setters
    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }
}
