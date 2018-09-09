package com.alpha.pos.cms.ui.model;

import com.alpha.pos.cms.ui.model.response.MenuAccessResponse;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SidebarMenu {

  List<MenuAccessResponse> sidebarMenu;
}
