package com.treenity.tree.controller;

import com.treenity.tree.dto.MemberRequest;
import com.treenity.tree.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/register")
    public String register() {
        return "member/register";
    }


    @PostMapping("/signup")
    public ResponseEntity<String> signup(@RequestBody MemberRequest request) {
        memberService.save(request);
        return ResponseEntity.ok("success");
    }
}
