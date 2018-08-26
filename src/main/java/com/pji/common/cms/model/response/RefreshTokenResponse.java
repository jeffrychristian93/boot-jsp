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
public class RefreshTokenResponse implements Serializable {
    private static final long serialVersionUID = 6345222187464176516L;
    private String token;
}
