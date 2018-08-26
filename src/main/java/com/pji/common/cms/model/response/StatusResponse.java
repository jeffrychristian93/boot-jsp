package com.pji.common.cms.model.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author Jeffry Christian
 * @since 13/03/2018
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class StatusResponse implements Serializable {

    private static final long serialVersionUID = -2822537135051260752L;
    private Status status;

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Status {
        private String code;
        private String cause;
        private String message;
        private String description;
    }
}
