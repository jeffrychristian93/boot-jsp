package com.pji.common.cms.model.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author Jeffry Christian
 * @since 13/03/2018
 */
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginResponse extends StatusResponse implements Serializable {

    private static final long serialVersionUID = -7273388621443355841L;
    private UserBodyResponse user;
    private String token;

}
