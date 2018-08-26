package com.pji.common.cms.controller.user;

import com.pji.common.cms.model.request.UserRequest;
import com.pji.common.cms.model.response.UserResponse;
import com.pji.common.cms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Jeffry Christian
 * @since 14/03/2018
 */
@RestController
@RequestMapping("user")
public class MasterUserController {

    @Autowired
    private UserService userService;

    @GetMapping
    public ModelAndView manageUsers(HttpServletRequest request , HttpServletResponse response){
        ModelAndView mv = new ModelAndView("user/master/main");
        mv.addObject("users" , userService.getAll(request).getBody());
        return mv;
    }

    @GetMapping("/add")
    public ModelAndView add(HttpServletRequest request , HttpServletResponse response){
        ModelAndView mv = new ModelAndView("user/master/formAdd");
        mv.addObject("user" , new UserRequest());
        return mv;
    }

    @PostMapping("/save")
    public ModelAndView save(HttpServletRequest request , HttpServletResponse response , @ModelAttribute("user") UserRequest user){
        ModelAndView mv = new ModelAndView();
        UserResponse userResponse = userService.save(user, request);
        mv.addObject("saveStatus" , userResponse.getStatus().getCode().equals("0") ? "SUCCESS" : "FAILED");
        return mv;
    }

    @GetMapping("/edit/{id}")
    public ModelAndView edit(HttpServletRequest request , HttpServletResponse response , @PathVariable("id") Long id){
        ModelAndView mv = new ModelAndView();
        return mv;
    }

    @PostMapping("/update")
    public ModelAndView update(HttpServletRequest request , HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        return mv;
    }
}
