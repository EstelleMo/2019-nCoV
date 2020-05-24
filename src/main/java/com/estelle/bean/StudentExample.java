package com.estelle.bean;

import java.util.ArrayList;
import java.util.List;

public class StudentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public StudentExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andNoIsNull() {
            addCriterion("no is null");
            return (Criteria) this;
        }

        public Criteria andNoIsNotNull() {
            addCriterion("no is not null");
            return (Criteria) this;
        }

        public Criteria andNoEqualTo(String value) {
            addCriterion("no =", value, "no");
            return (Criteria) this;
        }

        public Criteria andNoNotEqualTo(String value) {
            addCriterion("no <>", value, "no");
            return (Criteria) this;
        }

        public Criteria andNoGreaterThan(String value) {
            addCriterion("no >", value, "no");
            return (Criteria) this;
        }

        public Criteria andNoGreaterThanOrEqualTo(String value) {
            addCriterion("no >=", value, "no");
            return (Criteria) this;
        }

        public Criteria andNoLessThan(String value) {
            addCriterion("no <", value, "no");
            return (Criteria) this;
        }

        public Criteria andNoLessThanOrEqualTo(String value) {
            addCriterion("no <=", value, "no");
            return (Criteria) this;
        }

        public Criteria andNoLike(String value) {
            addCriterion("no like", value, "no");
            return (Criteria) this;
        }

        public Criteria andNoNotLike(String value) {
            addCriterion("no not like", value, "no");
            return (Criteria) this;
        }

        public Criteria andNoIn(List<String> values) {
            addCriterion("no in", values, "no");
            return (Criteria) this;
        }

        public Criteria andNoNotIn(List<String> values) {
            addCriterion("no not in", values, "no");
            return (Criteria) this;
        }

        public Criteria andNoBetween(String value1, String value2) {
            addCriterion("no between", value1, value2, "no");
            return (Criteria) this;
        }

        public Criteria andNoNotBetween(String value1, String value2) {
            addCriterion("no not between", value1, value2, "no");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andTelIsNull() {
            addCriterion("tel is null");
            return (Criteria) this;
        }

        public Criteria andTelIsNotNull() {
            addCriterion("tel is not null");
            return (Criteria) this;
        }

        public Criteria andTelEqualTo(String value) {
            addCriterion("tel =", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelNotEqualTo(String value) {
            addCriterion("tel <>", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelGreaterThan(String value) {
            addCriterion("tel >", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelGreaterThanOrEqualTo(String value) {
            addCriterion("tel >=", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelLessThan(String value) {
            addCriterion("tel <", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelLessThanOrEqualTo(String value) {
            addCriterion("tel <=", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelLike(String value) {
            addCriterion("tel like", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelNotLike(String value) {
            addCriterion("tel not like", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelIn(List<String> values) {
            addCriterion("tel in", values, "tel");
            return (Criteria) this;
        }

        public Criteria andTelNotIn(List<String> values) {
            addCriterion("tel not in", values, "tel");
            return (Criteria) this;
        }

        public Criteria andTelBetween(String value1, String value2) {
            addCriterion("tel between", value1, value2, "tel");
            return (Criteria) this;
        }

        public Criteria andTelNotBetween(String value1, String value2) {
            addCriterion("tel not between", value1, value2, "tel");
            return (Criteria) this;
        }

        public Criteria andIdcardIsNull() {
            addCriterion("idcard is null");
            return (Criteria) this;
        }

        public Criteria andIdcardIsNotNull() {
            addCriterion("idcard is not null");
            return (Criteria) this;
        }

        public Criteria andIdcardEqualTo(String value) {
            addCriterion("idcard =", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardNotEqualTo(String value) {
            addCriterion("idcard <>", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardGreaterThan(String value) {
            addCriterion("idcard >", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardGreaterThanOrEqualTo(String value) {
            addCriterion("idcard >=", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardLessThan(String value) {
            addCriterion("idcard <", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardLessThanOrEqualTo(String value) {
            addCriterion("idcard <=", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardLike(String value) {
            addCriterion("idcard like", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardNotLike(String value) {
            addCriterion("idcard not like", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardIn(List<String> values) {
            addCriterion("idcard in", values, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardNotIn(List<String> values) {
            addCriterion("idcard not in", values, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardBetween(String value1, String value2) {
            addCriterion("idcard between", value1, value2, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardNotBetween(String value1, String value2) {
            addCriterion("idcard not between", value1, value2, "idcard");
            return (Criteria) this;
        }

        public Criteria andGenderIsNull() {
            addCriterion("gender is null");
            return (Criteria) this;
        }

        public Criteria andGenderIsNotNull() {
            addCriterion("gender is not null");
            return (Criteria) this;
        }

        public Criteria andGenderEqualTo(String value) {
            addCriterion("gender =", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderNotEqualTo(String value) {
            addCriterion("gender <>", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderGreaterThan(String value) {
            addCriterion("gender >", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderGreaterThanOrEqualTo(String value) {
            addCriterion("gender >=", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderLessThan(String value) {
            addCriterion("gender <", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderLessThanOrEqualTo(String value) {
            addCriterion("gender <=", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderLike(String value) {
            addCriterion("gender like", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderNotLike(String value) {
            addCriterion("gender not like", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderIn(List<String> values) {
            addCriterion("gender in", values, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderNotIn(List<String> values) {
            addCriterion("gender not in", values, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderBetween(String value1, String value2) {
            addCriterion("gender between", value1, value2, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderNotBetween(String value1, String value2) {
            addCriterion("gender not between", value1, value2, "gender");
            return (Criteria) this;
        }

        public Criteria andRealPwdIsNull() {
            addCriterion("real_pwd is null");
            return (Criteria) this;
        }

        public Criteria andRealPwdIsNotNull() {
            addCriterion("real_pwd is not null");
            return (Criteria) this;
        }

        public Criteria andRealPwdEqualTo(String value) {
            addCriterion("real_pwd =", value, "realPwd");
            return (Criteria) this;
        }

        public Criteria andRealPwdNotEqualTo(String value) {
            addCriterion("real_pwd <>", value, "realPwd");
            return (Criteria) this;
        }

        public Criteria andRealPwdGreaterThan(String value) {
            addCriterion("real_pwd >", value, "realPwd");
            return (Criteria) this;
        }

        public Criteria andRealPwdGreaterThanOrEqualTo(String value) {
            addCriterion("real_pwd >=", value, "realPwd");
            return (Criteria) this;
        }

        public Criteria andRealPwdLessThan(String value) {
            addCriterion("real_pwd <", value, "realPwd");
            return (Criteria) this;
        }

        public Criteria andRealPwdLessThanOrEqualTo(String value) {
            addCriterion("real_pwd <=", value, "realPwd");
            return (Criteria) this;
        }

        public Criteria andRealPwdLike(String value) {
            addCriterion("real_pwd like", value, "realPwd");
            return (Criteria) this;
        }

        public Criteria andRealPwdNotLike(String value) {
            addCriterion("real_pwd not like", value, "realPwd");
            return (Criteria) this;
        }

        public Criteria andRealPwdIn(List<String> values) {
            addCriterion("real_pwd in", values, "realPwd");
            return (Criteria) this;
        }

        public Criteria andRealPwdNotIn(List<String> values) {
            addCriterion("real_pwd not in", values, "realPwd");
            return (Criteria) this;
        }

        public Criteria andRealPwdBetween(String value1, String value2) {
            addCriterion("real_pwd between", value1, value2, "realPwd");
            return (Criteria) this;
        }

        public Criteria andRealPwdNotBetween(String value1, String value2) {
            addCriterion("real_pwd not between", value1, value2, "realPwd");
            return (Criteria) this;
        }

        public Criteria andDefaultPwdIsNull() {
            addCriterion("default_pwd is null");
            return (Criteria) this;
        }

        public Criteria andDefaultPwdIsNotNull() {
            addCriterion("default_pwd is not null");
            return (Criteria) this;
        }

        public Criteria andDefaultPwdEqualTo(String value) {
            addCriterion("default_pwd =", value, "defaultPwd");
            return (Criteria) this;
        }

        public Criteria andDefaultPwdNotEqualTo(String value) {
            addCriterion("default_pwd <>", value, "defaultPwd");
            return (Criteria) this;
        }

        public Criteria andDefaultPwdGreaterThan(String value) {
            addCriterion("default_pwd >", value, "defaultPwd");
            return (Criteria) this;
        }

        public Criteria andDefaultPwdGreaterThanOrEqualTo(String value) {
            addCriterion("default_pwd >=", value, "defaultPwd");
            return (Criteria) this;
        }

        public Criteria andDefaultPwdLessThan(String value) {
            addCriterion("default_pwd <", value, "defaultPwd");
            return (Criteria) this;
        }

        public Criteria andDefaultPwdLessThanOrEqualTo(String value) {
            addCriterion("default_pwd <=", value, "defaultPwd");
            return (Criteria) this;
        }

        public Criteria andDefaultPwdLike(String value) {
            addCriterion("default_pwd like", value, "defaultPwd");
            return (Criteria) this;
        }

        public Criteria andDefaultPwdNotLike(String value) {
            addCriterion("default_pwd not like", value, "defaultPwd");
            return (Criteria) this;
        }

        public Criteria andDefaultPwdIn(List<String> values) {
            addCriterion("default_pwd in", values, "defaultPwd");
            return (Criteria) this;
        }

        public Criteria andDefaultPwdNotIn(List<String> values) {
            addCriterion("default_pwd not in", values, "defaultPwd");
            return (Criteria) this;
        }

        public Criteria andDefaultPwdBetween(String value1, String value2) {
            addCriterion("default_pwd between", value1, value2, "defaultPwd");
            return (Criteria) this;
        }

        public Criteria andDefaultPwdNotBetween(String value1, String value2) {
            addCriterion("default_pwd not between", value1, value2, "defaultPwd");
            return (Criteria) this;
        }

        public Criteria andRoleIsNull() {
            addCriterion("role is null");
            return (Criteria) this;
        }

        public Criteria andRoleIsNotNull() {
            addCriterion("role is not null");
            return (Criteria) this;
        }

        public Criteria andRoleEqualTo(String value) {
            addCriterion("role =", value, "role");
            return (Criteria) this;
        }

        public Criteria andRoleNotEqualTo(String value) {
            addCriterion("role <>", value, "role");
            return (Criteria) this;
        }

        public Criteria andRoleGreaterThan(String value) {
            addCriterion("role >", value, "role");
            return (Criteria) this;
        }

        public Criteria andRoleGreaterThanOrEqualTo(String value) {
            addCriterion("role >=", value, "role");
            return (Criteria) this;
        }

        public Criteria andRoleLessThan(String value) {
            addCriterion("role <", value, "role");
            return (Criteria) this;
        }

        public Criteria andRoleLessThanOrEqualTo(String value) {
            addCriterion("role <=", value, "role");
            return (Criteria) this;
        }

        public Criteria andRoleLike(String value) {
            addCriterion("role like", value, "role");
            return (Criteria) this;
        }

        public Criteria andRoleNotLike(String value) {
            addCriterion("role not like", value, "role");
            return (Criteria) this;
        }

        public Criteria andRoleIn(List<String> values) {
            addCriterion("role in", values, "role");
            return (Criteria) this;
        }

        public Criteria andRoleNotIn(List<String> values) {
            addCriterion("role not in", values, "role");
            return (Criteria) this;
        }

        public Criteria andRoleBetween(String value1, String value2) {
            addCriterion("role between", value1, value2, "role");
            return (Criteria) this;
        }

        public Criteria andRoleNotBetween(String value1, String value2) {
            addCriterion("role not between", value1, value2, "role");
            return (Criteria) this;
        }

        public Criteria andCollegeIsNull() {
            addCriterion("college is null");
            return (Criteria) this;
        }

        public Criteria andCollegeIsNotNull() {
            addCriterion("college is not null");
            return (Criteria) this;
        }

        public Criteria andCollegeEqualTo(String value) {
            addCriterion("college =", value, "college");
            return (Criteria) this;
        }

        public Criteria andCollegeNotEqualTo(String value) {
            addCriterion("college <>", value, "college");
            return (Criteria) this;
        }

        public Criteria andCollegeGreaterThan(String value) {
            addCriterion("college >", value, "college");
            return (Criteria) this;
        }

        public Criteria andCollegeGreaterThanOrEqualTo(String value) {
            addCriterion("college >=", value, "college");
            return (Criteria) this;
        }

        public Criteria andCollegeLessThan(String value) {
            addCriterion("college <", value, "college");
            return (Criteria) this;
        }

        public Criteria andCollegeLessThanOrEqualTo(String value) {
            addCriterion("college <=", value, "college");
            return (Criteria) this;
        }

        public Criteria andCollegeLike(String value) {
            addCriterion("college like", value, "college");
            return (Criteria) this;
        }

        public Criteria andCollegeNotLike(String value) {
            addCriterion("college not like", value, "college");
            return (Criteria) this;
        }

        public Criteria andCollegeIn(List<String> values) {
            addCriterion("college in", values, "college");
            return (Criteria) this;
        }

        public Criteria andCollegeNotIn(List<String> values) {
            addCriterion("college not in", values, "college");
            return (Criteria) this;
        }

        public Criteria andCollegeBetween(String value1, String value2) {
            addCriterion("college between", value1, value2, "college");
            return (Criteria) this;
        }

        public Criteria andCollegeNotBetween(String value1, String value2) {
            addCriterion("college not between", value1, value2, "college");
            return (Criteria) this;
        }

        public Criteria andClassNoIsNull() {
            addCriterion("class_no is null");
            return (Criteria) this;
        }

        public Criteria andClassNoIsNotNull() {
            addCriterion("class_no is not null");
            return (Criteria) this;
        }

        public Criteria andClassNoEqualTo(String value) {
            addCriterion("class_no =", value, "classNo");
            return (Criteria) this;
        }

        public Criteria andClassNoNotEqualTo(String value) {
            addCriterion("class_no <>", value, "classNo");
            return (Criteria) this;
        }

        public Criteria andClassNoGreaterThan(String value) {
            addCriterion("class_no >", value, "classNo");
            return (Criteria) this;
        }

        public Criteria andClassNoGreaterThanOrEqualTo(String value) {
            addCriterion("class_no >=", value, "classNo");
            return (Criteria) this;
        }

        public Criteria andClassNoLessThan(String value) {
            addCriterion("class_no <", value, "classNo");
            return (Criteria) this;
        }

        public Criteria andClassNoLessThanOrEqualTo(String value) {
            addCriterion("class_no <=", value, "classNo");
            return (Criteria) this;
        }

        public Criteria andClassNoLike(String value) {
            addCriterion("class_no like", value, "classNo");
            return (Criteria) this;
        }

        public Criteria andClassNoNotLike(String value) {
            addCriterion("class_no not like", value, "classNo");
            return (Criteria) this;
        }

        public Criteria andClassNoIn(List<String> values) {
            addCriterion("class_no in", values, "classNo");
            return (Criteria) this;
        }

        public Criteria andClassNoNotIn(List<String> values) {
            addCriterion("class_no not in", values, "classNo");
            return (Criteria) this;
        }

        public Criteria andClassNoBetween(String value1, String value2) {
            addCriterion("class_no between", value1, value2, "classNo");
            return (Criteria) this;
        }

        public Criteria andClassNoNotBetween(String value1, String value2) {
            addCriterion("class_no not between", value1, value2, "classNo");
            return (Criteria) this;
        }

        public Criteria andNativePlaceIsNull() {
            addCriterion("native_place is null");
            return (Criteria) this;
        }

        public Criteria andNativePlaceIsNotNull() {
            addCriterion("native_place is not null");
            return (Criteria) this;
        }

        public Criteria andNativePlaceEqualTo(String value) {
            addCriterion("native_place =", value, "nativePlace");
            return (Criteria) this;
        }

        public Criteria andNativePlaceNotEqualTo(String value) {
            addCriterion("native_place <>", value, "nativePlace");
            return (Criteria) this;
        }

        public Criteria andNativePlaceGreaterThan(String value) {
            addCriterion("native_place >", value, "nativePlace");
            return (Criteria) this;
        }

        public Criteria andNativePlaceGreaterThanOrEqualTo(String value) {
            addCriterion("native_place >=", value, "nativePlace");
            return (Criteria) this;
        }

        public Criteria andNativePlaceLessThan(String value) {
            addCriterion("native_place <", value, "nativePlace");
            return (Criteria) this;
        }

        public Criteria andNativePlaceLessThanOrEqualTo(String value) {
            addCriterion("native_place <=", value, "nativePlace");
            return (Criteria) this;
        }

        public Criteria andNativePlaceLike(String value) {
            addCriterion("native_place like", value, "nativePlace");
            return (Criteria) this;
        }

        public Criteria andNativePlaceNotLike(String value) {
            addCriterion("native_place not like", value, "nativePlace");
            return (Criteria) this;
        }

        public Criteria andNativePlaceIn(List<String> values) {
            addCriterion("native_place in", values, "nativePlace");
            return (Criteria) this;
        }

        public Criteria andNativePlaceNotIn(List<String> values) {
            addCriterion("native_place not in", values, "nativePlace");
            return (Criteria) this;
        }

        public Criteria andNativePlaceBetween(String value1, String value2) {
            addCriterion("native_place between", value1, value2, "nativePlace");
            return (Criteria) this;
        }

        public Criteria andNativePlaceNotBetween(String value1, String value2) {
            addCriterion("native_place not between", value1, value2, "nativePlace");
            return (Criteria) this;
        }

        public Criteria andHomeDetAddIsNull() {
            addCriterion("home_det_add is null");
            return (Criteria) this;
        }

        public Criteria andHomeDetAddIsNotNull() {
            addCriterion("home_det_add is not null");
            return (Criteria) this;
        }

        public Criteria andHomeDetAddEqualTo(String value) {
            addCriterion("home_det_add =", value, "homeDetAdd");
            return (Criteria) this;
        }

        public Criteria andHomeDetAddNotEqualTo(String value) {
            addCriterion("home_det_add <>", value, "homeDetAdd");
            return (Criteria) this;
        }

        public Criteria andHomeDetAddGreaterThan(String value) {
            addCriterion("home_det_add >", value, "homeDetAdd");
            return (Criteria) this;
        }

        public Criteria andHomeDetAddGreaterThanOrEqualTo(String value) {
            addCriterion("home_det_add >=", value, "homeDetAdd");
            return (Criteria) this;
        }

        public Criteria andHomeDetAddLessThan(String value) {
            addCriterion("home_det_add <", value, "homeDetAdd");
            return (Criteria) this;
        }

        public Criteria andHomeDetAddLessThanOrEqualTo(String value) {
            addCriterion("home_det_add <=", value, "homeDetAdd");
            return (Criteria) this;
        }

        public Criteria andHomeDetAddLike(String value) {
            addCriterion("home_det_add like", value, "homeDetAdd");
            return (Criteria) this;
        }

        public Criteria andHomeDetAddNotLike(String value) {
            addCriterion("home_det_add not like", value, "homeDetAdd");
            return (Criteria) this;
        }

        public Criteria andHomeDetAddIn(List<String> values) {
            addCriterion("home_det_add in", values, "homeDetAdd");
            return (Criteria) this;
        }

        public Criteria andHomeDetAddNotIn(List<String> values) {
            addCriterion("home_det_add not in", values, "homeDetAdd");
            return (Criteria) this;
        }

        public Criteria andHomeDetAddBetween(String value1, String value2) {
            addCriterion("home_det_add between", value1, value2, "homeDetAdd");
            return (Criteria) this;
        }

        public Criteria andHomeDetAddNotBetween(String value1, String value2) {
            addCriterion("home_det_add not between", value1, value2, "homeDetAdd");
            return (Criteria) this;
        }

        public Criteria andApplyBackSchIsNull() {
            addCriterion("apply_back_sch is null");
            return (Criteria) this;
        }

        public Criteria andApplyBackSchIsNotNull() {
            addCriterion("apply_back_sch is not null");
            return (Criteria) this;
        }

        public Criteria andApplyBackSchEqualTo(String value) {
            addCriterion("apply_back_sch =", value, "applyBackSch");
            return (Criteria) this;
        }

        public Criteria andApplyBackSchNotEqualTo(String value) {
            addCriterion("apply_back_sch <>", value, "applyBackSch");
            return (Criteria) this;
        }

        public Criteria andApplyBackSchGreaterThan(String value) {
            addCriterion("apply_back_sch >", value, "applyBackSch");
            return (Criteria) this;
        }

        public Criteria andApplyBackSchGreaterThanOrEqualTo(String value) {
            addCriterion("apply_back_sch >=", value, "applyBackSch");
            return (Criteria) this;
        }

        public Criteria andApplyBackSchLessThan(String value) {
            addCriterion("apply_back_sch <", value, "applyBackSch");
            return (Criteria) this;
        }

        public Criteria andApplyBackSchLessThanOrEqualTo(String value) {
            addCriterion("apply_back_sch <=", value, "applyBackSch");
            return (Criteria) this;
        }

        public Criteria andApplyBackSchLike(String value) {
            addCriterion("apply_back_sch like", value, "applyBackSch");
            return (Criteria) this;
        }

        public Criteria andApplyBackSchNotLike(String value) {
            addCriterion("apply_back_sch not like", value, "applyBackSch");
            return (Criteria) this;
        }

        public Criteria andApplyBackSchIn(List<String> values) {
            addCriterion("apply_back_sch in", values, "applyBackSch");
            return (Criteria) this;
        }

        public Criteria andApplyBackSchNotIn(List<String> values) {
            addCriterion("apply_back_sch not in", values, "applyBackSch");
            return (Criteria) this;
        }

        public Criteria andApplyBackSchBetween(String value1, String value2) {
            addCriterion("apply_back_sch between", value1, value2, "applyBackSch");
            return (Criteria) this;
        }

        public Criteria andApplyBackSchNotBetween(String value1, String value2) {
            addCriterion("apply_back_sch not between", value1, value2, "applyBackSch");
            return (Criteria) this;
        }

        public Criteria andApplyStatusIsNull() {
            addCriterion("apply_status is null");
            return (Criteria) this;
        }

        public Criteria andApplyStatusIsNotNull() {
            addCriterion("apply_status is not null");
            return (Criteria) this;
        }

        public Criteria andApplyStatusEqualTo(String value) {
            addCriterion("apply_status =", value, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusNotEqualTo(String value) {
            addCriterion("apply_status <>", value, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusGreaterThan(String value) {
            addCriterion("apply_status >", value, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusGreaterThanOrEqualTo(String value) {
            addCriterion("apply_status >=", value, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusLessThan(String value) {
            addCriterion("apply_status <", value, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusLessThanOrEqualTo(String value) {
            addCriterion("apply_status <=", value, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusLike(String value) {
            addCriterion("apply_status like", value, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusNotLike(String value) {
            addCriterion("apply_status not like", value, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusIn(List<String> values) {
            addCriterion("apply_status in", values, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusNotIn(List<String> values) {
            addCriterion("apply_status not in", values, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusBetween(String value1, String value2) {
            addCriterion("apply_status between", value1, value2, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusNotBetween(String value1, String value2) {
            addCriterion("apply_status not between", value1, value2, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andNativeProvinceIsNull() {
            addCriterion("native_province is null");
            return (Criteria) this;
        }

        public Criteria andNativeProvinceIsNotNull() {
            addCriterion("native_province is not null");
            return (Criteria) this;
        }

        public Criteria andNativeProvinceEqualTo(String value) {
            addCriterion("native_province =", value, "nativeProvince");
            return (Criteria) this;
        }

        public Criteria andNativeProvinceNotEqualTo(String value) {
            addCriterion("native_province <>", value, "nativeProvince");
            return (Criteria) this;
        }

        public Criteria andNativeProvinceGreaterThan(String value) {
            addCriterion("native_province >", value, "nativeProvince");
            return (Criteria) this;
        }

        public Criteria andNativeProvinceGreaterThanOrEqualTo(String value) {
            addCriterion("native_province >=", value, "nativeProvince");
            return (Criteria) this;
        }

        public Criteria andNativeProvinceLessThan(String value) {
            addCriterion("native_province <", value, "nativeProvince");
            return (Criteria) this;
        }

        public Criteria andNativeProvinceLessThanOrEqualTo(String value) {
            addCriterion("native_province <=", value, "nativeProvince");
            return (Criteria) this;
        }

        public Criteria andNativeProvinceLike(String value) {
            addCriterion("native_province like", value, "nativeProvince");
            return (Criteria) this;
        }

        public Criteria andNativeProvinceNotLike(String value) {
            addCriterion("native_province not like", value, "nativeProvince");
            return (Criteria) this;
        }

        public Criteria andNativeProvinceIn(List<String> values) {
            addCriterion("native_province in", values, "nativeProvince");
            return (Criteria) this;
        }

        public Criteria andNativeProvinceNotIn(List<String> values) {
            addCriterion("native_province not in", values, "nativeProvince");
            return (Criteria) this;
        }

        public Criteria andNativeProvinceBetween(String value1, String value2) {
            addCriterion("native_province between", value1, value2, "nativeProvince");
            return (Criteria) this;
        }

        public Criteria andNativeProvinceNotBetween(String value1, String value2) {
            addCriterion("native_province not between", value1, value2, "nativeProvince");
            return (Criteria) this;
        }

        public Criteria andNativeCityIsNull() {
            addCriterion("native_city is null");
            return (Criteria) this;
        }

        public Criteria andNativeCityIsNotNull() {
            addCriterion("native_city is not null");
            return (Criteria) this;
        }

        public Criteria andNativeCityEqualTo(String value) {
            addCriterion("native_city =", value, "nativeCity");
            return (Criteria) this;
        }

        public Criteria andNativeCityNotEqualTo(String value) {
            addCriterion("native_city <>", value, "nativeCity");
            return (Criteria) this;
        }

        public Criteria andNativeCityGreaterThan(String value) {
            addCriterion("native_city >", value, "nativeCity");
            return (Criteria) this;
        }

        public Criteria andNativeCityGreaterThanOrEqualTo(String value) {
            addCriterion("native_city >=", value, "nativeCity");
            return (Criteria) this;
        }

        public Criteria andNativeCityLessThan(String value) {
            addCriterion("native_city <", value, "nativeCity");
            return (Criteria) this;
        }

        public Criteria andNativeCityLessThanOrEqualTo(String value) {
            addCriterion("native_city <=", value, "nativeCity");
            return (Criteria) this;
        }

        public Criteria andNativeCityLike(String value) {
            addCriterion("native_city like", value, "nativeCity");
            return (Criteria) this;
        }

        public Criteria andNativeCityNotLike(String value) {
            addCriterion("native_city not like", value, "nativeCity");
            return (Criteria) this;
        }

        public Criteria andNativeCityIn(List<String> values) {
            addCriterion("native_city in", values, "nativeCity");
            return (Criteria) this;
        }

        public Criteria andNativeCityNotIn(List<String> values) {
            addCriterion("native_city not in", values, "nativeCity");
            return (Criteria) this;
        }

        public Criteria andNativeCityBetween(String value1, String value2) {
            addCriterion("native_city between", value1, value2, "nativeCity");
            return (Criteria) this;
        }

        public Criteria andNativeCityNotBetween(String value1, String value2) {
            addCriterion("native_city not between", value1, value2, "nativeCity");
            return (Criteria) this;
        }

        public Criteria andNativeAreaIsNull() {
            addCriterion("native_area is null");
            return (Criteria) this;
        }

        public Criteria andNativeAreaIsNotNull() {
            addCriterion("native_area is not null");
            return (Criteria) this;
        }

        public Criteria andNativeAreaEqualTo(String value) {
            addCriterion("native_area =", value, "nativeArea");
            return (Criteria) this;
        }

        public Criteria andNativeAreaNotEqualTo(String value) {
            addCriterion("native_area <>", value, "nativeArea");
            return (Criteria) this;
        }

        public Criteria andNativeAreaGreaterThan(String value) {
            addCriterion("native_area >", value, "nativeArea");
            return (Criteria) this;
        }

        public Criteria andNativeAreaGreaterThanOrEqualTo(String value) {
            addCriterion("native_area >=", value, "nativeArea");
            return (Criteria) this;
        }

        public Criteria andNativeAreaLessThan(String value) {
            addCriterion("native_area <", value, "nativeArea");
            return (Criteria) this;
        }

        public Criteria andNativeAreaLessThanOrEqualTo(String value) {
            addCriterion("native_area <=", value, "nativeArea");
            return (Criteria) this;
        }

        public Criteria andNativeAreaLike(String value) {
            addCriterion("native_area like", value, "nativeArea");
            return (Criteria) this;
        }

        public Criteria andNativeAreaNotLike(String value) {
            addCriterion("native_area not like", value, "nativeArea");
            return (Criteria) this;
        }

        public Criteria andNativeAreaIn(List<String> values) {
            addCriterion("native_area in", values, "nativeArea");
            return (Criteria) this;
        }

        public Criteria andNativeAreaNotIn(List<String> values) {
            addCriterion("native_area not in", values, "nativeArea");
            return (Criteria) this;
        }

        public Criteria andNativeAreaBetween(String value1, String value2) {
            addCriterion("native_area between", value1, value2, "nativeArea");
            return (Criteria) this;
        }

        public Criteria andNativeAreaNotBetween(String value1, String value2) {
            addCriterion("native_area not between", value1, value2, "nativeArea");
            return (Criteria) this;
        }

        public Criteria andHomeProvinceIsNull() {
            addCriterion("home_province is null");
            return (Criteria) this;
        }

        public Criteria andHomeProvinceIsNotNull() {
            addCriterion("home_province is not null");
            return (Criteria) this;
        }

        public Criteria andHomeProvinceEqualTo(String value) {
            addCriterion("home_province =", value, "homeProvince");
            return (Criteria) this;
        }

        public Criteria andHomeProvinceNotEqualTo(String value) {
            addCriterion("home_province <>", value, "homeProvince");
            return (Criteria) this;
        }

        public Criteria andHomeProvinceGreaterThan(String value) {
            addCriterion("home_province >", value, "homeProvince");
            return (Criteria) this;
        }

        public Criteria andHomeProvinceGreaterThanOrEqualTo(String value) {
            addCriterion("home_province >=", value, "homeProvince");
            return (Criteria) this;
        }

        public Criteria andHomeProvinceLessThan(String value) {
            addCriterion("home_province <", value, "homeProvince");
            return (Criteria) this;
        }

        public Criteria andHomeProvinceLessThanOrEqualTo(String value) {
            addCriterion("home_province <=", value, "homeProvince");
            return (Criteria) this;
        }

        public Criteria andHomeProvinceLike(String value) {
            addCriterion("home_province like", value, "homeProvince");
            return (Criteria) this;
        }

        public Criteria andHomeProvinceNotLike(String value) {
            addCriterion("home_province not like", value, "homeProvince");
            return (Criteria) this;
        }

        public Criteria andHomeProvinceIn(List<String> values) {
            addCriterion("home_province in", values, "homeProvince");
            return (Criteria) this;
        }

        public Criteria andHomeProvinceNotIn(List<String> values) {
            addCriterion("home_province not in", values, "homeProvince");
            return (Criteria) this;
        }

        public Criteria andHomeProvinceBetween(String value1, String value2) {
            addCriterion("home_province between", value1, value2, "homeProvince");
            return (Criteria) this;
        }

        public Criteria andHomeProvinceNotBetween(String value1, String value2) {
            addCriterion("home_province not between", value1, value2, "homeProvince");
            return (Criteria) this;
        }

        public Criteria andHomeCityIsNull() {
            addCriterion("home_city is null");
            return (Criteria) this;
        }

        public Criteria andHomeCityIsNotNull() {
            addCriterion("home_city is not null");
            return (Criteria) this;
        }

        public Criteria andHomeCityEqualTo(String value) {
            addCriterion("home_city =", value, "homeCity");
            return (Criteria) this;
        }

        public Criteria andHomeCityNotEqualTo(String value) {
            addCriterion("home_city <>", value, "homeCity");
            return (Criteria) this;
        }

        public Criteria andHomeCityGreaterThan(String value) {
            addCriterion("home_city >", value, "homeCity");
            return (Criteria) this;
        }

        public Criteria andHomeCityGreaterThanOrEqualTo(String value) {
            addCriterion("home_city >=", value, "homeCity");
            return (Criteria) this;
        }

        public Criteria andHomeCityLessThan(String value) {
            addCriterion("home_city <", value, "homeCity");
            return (Criteria) this;
        }

        public Criteria andHomeCityLessThanOrEqualTo(String value) {
            addCriterion("home_city <=", value, "homeCity");
            return (Criteria) this;
        }

        public Criteria andHomeCityLike(String value) {
            addCriterion("home_city like", value, "homeCity");
            return (Criteria) this;
        }

        public Criteria andHomeCityNotLike(String value) {
            addCriterion("home_city not like", value, "homeCity");
            return (Criteria) this;
        }

        public Criteria andHomeCityIn(List<String> values) {
            addCriterion("home_city in", values, "homeCity");
            return (Criteria) this;
        }

        public Criteria andHomeCityNotIn(List<String> values) {
            addCriterion("home_city not in", values, "homeCity");
            return (Criteria) this;
        }

        public Criteria andHomeCityBetween(String value1, String value2) {
            addCriterion("home_city between", value1, value2, "homeCity");
            return (Criteria) this;
        }

        public Criteria andHomeCityNotBetween(String value1, String value2) {
            addCriterion("home_city not between", value1, value2, "homeCity");
            return (Criteria) this;
        }

        public Criteria andHomeAreaIsNull() {
            addCriterion("home_area is null");
            return (Criteria) this;
        }

        public Criteria andHomeAreaIsNotNull() {
            addCriterion("home_area is not null");
            return (Criteria) this;
        }

        public Criteria andHomeAreaEqualTo(String value) {
            addCriterion("home_area =", value, "homeArea");
            return (Criteria) this;
        }

        public Criteria andHomeAreaNotEqualTo(String value) {
            addCriterion("home_area <>", value, "homeArea");
            return (Criteria) this;
        }

        public Criteria andHomeAreaGreaterThan(String value) {
            addCriterion("home_area >", value, "homeArea");
            return (Criteria) this;
        }

        public Criteria andHomeAreaGreaterThanOrEqualTo(String value) {
            addCriterion("home_area >=", value, "homeArea");
            return (Criteria) this;
        }

        public Criteria andHomeAreaLessThan(String value) {
            addCriterion("home_area <", value, "homeArea");
            return (Criteria) this;
        }

        public Criteria andHomeAreaLessThanOrEqualTo(String value) {
            addCriterion("home_area <=", value, "homeArea");
            return (Criteria) this;
        }

        public Criteria andHomeAreaLike(String value) {
            addCriterion("home_area like", value, "homeArea");
            return (Criteria) this;
        }

        public Criteria andHomeAreaNotLike(String value) {
            addCriterion("home_area not like", value, "homeArea");
            return (Criteria) this;
        }

        public Criteria andHomeAreaIn(List<String> values) {
            addCriterion("home_area in", values, "homeArea");
            return (Criteria) this;
        }

        public Criteria andHomeAreaNotIn(List<String> values) {
            addCriterion("home_area not in", values, "homeArea");
            return (Criteria) this;
        }

        public Criteria andHomeAreaBetween(String value1, String value2) {
            addCriterion("home_area between", value1, value2, "homeArea");
            return (Criteria) this;
        }

        public Criteria andHomeAreaNotBetween(String value1, String value2) {
            addCriterion("home_area not between", value1, value2, "homeArea");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}