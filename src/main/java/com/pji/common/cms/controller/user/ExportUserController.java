package com.pji.common.cms.controller.user;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Jeffry Christian
 * @since 14/03/2018
 */
@RestController
@RequestMapping("user")
public class ExportUserController {

    @GetMapping(value = "/export")
    public ModelAndView manageUsers() {
        return new ModelAndView("user/export/main");
    }


}
