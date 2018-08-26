package com.pji.common.cms.model.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * @author Jeffry Christian
 * @since 27/03/2018
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserResponse extends StatusResponse implements Serializable {
    private static final long serialVersionUID = 5399261781511188164L;
    List<UserBodyResponse> body;
}
