package com.treenity.tree.controller;

import com.treenity.tree.dto.CreateMember;
import com.treenity.tree.service.MemberService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/member/*")
public class MemberController {

    private final MemberService memberService;

    @PostMapping("create-member")
    public CreateMember.Response createMember(
            @Valid @RequestBody CreateMember.Request request) {
        log.info("request : {}", request);
        return memberService.createMember(request);
    }
}
