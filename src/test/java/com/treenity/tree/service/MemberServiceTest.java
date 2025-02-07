package com.treenity.tree.service;

import com.treenity.tree.domain.Member;
import com.treenity.tree.dto.CreateMember;
import com.treenity.tree.repository.MemberRepository;
import com.treenity.tree.type.MemberType;
import com.treenity.tree.type.TermsAgreeType;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDateTime;

import static org.awaitility.Awaitility.given;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

@ExtendWith(MockitoExtension.class)
class MemberServiceTest {

    @Mock
    private MemberRepository memberRepository;

    @InjectMocks
    private MemberService memberService;

    private final CreateMember.Request defalutCreateReqeust = CreateMember.Request.builder()
            .id("user01")
            .name("유저01")
            .pw("treenity0123")
            .birthday(LocalDateTime.now())
            .email("treenity@gmail.com")
            .phone("010-0000-0000")
            .memberType(MemberType.USER)
            .signDate(LocalDateTime.now())
            .terms(TermsAgreeType.AGREE)
            .build();


    // 특정 유저 생성 성공 확인 테스트
    @Test
    void createMemberTest_success() {

        ArgumentCaptor<Member> captor =
                ArgumentCaptor.forClass(Member.class);

        memberService.createMember(defalutCreateReqeust);

        verify(memberRepository, times(1))
                .save(captor.capture());

        Member saveMember = captor.getValue();
    }
}