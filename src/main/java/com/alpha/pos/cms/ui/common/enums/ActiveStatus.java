package com.alpha.pos.cms.ui.common.enums;

public enum ActiveStatus {

    ACTIVE("Active"),
    INACTIVE("Inactive");

    private String value;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    private ActiveStatus(String value) {
        this.value = value;
    }
}
