package com.cinema.biz.model.base;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sim_type_field")
public class TSimTypeField {
	@Id
    private String typeFieldId;

    private String fieldId;

    private String typeId;

    public String getTypeFieldId() {
        return typeFieldId;
    }

    public void setTypeFieldId(String typeFieldId) {
        this.typeFieldId = typeFieldId == null ? null : typeFieldId.trim();
    }

    public String getFieldId() {
        return fieldId;
    }

    public void setFieldId(String fieldId) {
        this.fieldId = fieldId == null ? null : fieldId.trim();
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId == null ? null : typeId.trim();
    }

}