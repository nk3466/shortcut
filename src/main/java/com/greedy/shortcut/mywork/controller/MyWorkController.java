package com.greedy.shortcut.mywork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mywork/*")
public class MyWorkController {

	@GetMapping("/mywork")
	public void mywork() {}
}
