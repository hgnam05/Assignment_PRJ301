/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author namdh
 */
public class Attendance {
    private int aid;
    private int sid;
    private Date adate;
    private int tid;
    private int cid;
    private boolean present;

    public Attendance(int aid, int sid, Date adate, int tid, int cid, boolean present) {
        this.aid = aid;
        this.sid = sid;
        this.adate = adate;
        this.tid = tid;
        this.cid = cid;
        this.present = present;
    }

    public Attendance() {
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }


    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public Date getAdate() {
        return adate;
    }

    public void setAdate(Date adate) {
        this.adate = adate;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public boolean isPresent() {
        return present;
    }

    public void setPresent(boolean present) {
        this.present = present;
    }
    
}
