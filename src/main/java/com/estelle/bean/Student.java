package com.estelle.bean;

public class Student {
    private Integer id;

    private Integer no;

    private String name;

    private String tel;

    private String idcard;

    private String gender;

    private String realPwd;

    private String defaultPwd;

    private String role;

    private String college;

    private String classNo;

    private String nativePlace;

    private String homeDetAdd;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNo() {
        return no;
    }

    public void setNo(Integer no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getRealPwd() {
        return realPwd;
    }

    public void setRealPwd(String realPwd) {
        this.realPwd = realPwd == null ? null : realPwd.trim();
    }

    public String getDefaultPwd() {
        return defaultPwd;
    }

    public void setDefaultPwd(String defaultPwd) {
        this.defaultPwd = defaultPwd == null ? null : defaultPwd.trim();
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role == null ? null : role.trim();
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college == null ? null : college.trim();
    }

    public String getClassNo() {
        return classNo;
    }

    public void setClassNo(String classNo) {
        this.classNo = classNo == null ? null : classNo.trim();
    }

    public String getNativePlace() {
        return nativePlace;
    }

    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace == null ? null : nativePlace.trim();
    }

    public String getHomeDetAdd() {
        return homeDetAdd;
    }

    public void setHomeDetAdd(String homeDetAdd) {
        this.homeDetAdd = homeDetAdd == null ? null : homeDetAdd.trim();
    }

	@Override
	public String toString() {
		return "Student [id=" + id + ", no=" + no + ", name=" + name + "]";
	}
    
}