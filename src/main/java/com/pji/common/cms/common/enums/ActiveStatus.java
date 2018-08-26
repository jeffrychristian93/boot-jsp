package com.pji.common.cms.common.enums;

/**
 * @author Jeffry Christian
 * @since 22/03/2018
 */
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
