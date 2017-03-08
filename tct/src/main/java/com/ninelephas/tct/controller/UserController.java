/*
 * Copyright 九象网络科技（上海）有限公司 (c) 2017.
 *
 * author： 徐泽宇(roamer)
 *
 * class: com.ninelephas.tct.controller.UserController
 *
 * created： 2017-03-08 11:45
 * lastModified： 2017-03-08 11:45
 *
 */

package com.ninelephas.tct.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


/**
 *
 */
@Controller("com.ninelephas.tct.controller.UserController")
@RequestMapping(value = "/user")
@Log4j2
public class UserController {



    /**
     *
     * @param userName
     * @param oPasswd
     * @return
     */
    @RequestMapping(value = "/login", produces = "application/json;charset=utf-8", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView login(String userName, String oPasswd) {
        log.debug("开始进行登录处理！");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/index");
        return mv;
    }
}
