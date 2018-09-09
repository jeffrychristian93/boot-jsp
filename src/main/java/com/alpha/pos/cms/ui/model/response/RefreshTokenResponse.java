package com.alpha.pos.cms.ui.model.response;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RefreshTokenResponse implements Serializable {
    private static final long serialVersionUID = 6345222187464176516L;
    private String token;
}
