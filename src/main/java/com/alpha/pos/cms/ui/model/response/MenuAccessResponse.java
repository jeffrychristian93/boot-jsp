package com.alpha.pos.cms.ui.model.response;

import java.util.List;
import lombok.Data;

@Data
public class MenuAccessResponse {

  private String accessCode;
  private String accessName;
  private String pathUrl;
  private List<MenuAccessResponse> subMenu;
}
