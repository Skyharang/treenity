package com.treenity.tree.service;

import com.treenity.tree.domain.Member;
import com.treenity.tree.dto.MemberRequest;
import com.treenity.tree.repository.MemberRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;

    @Transactional
    public void save(MemberRequest request) {
        if (memberRepository.findByUserId(request.getUserId()).isPresent()) {
            throw new IllegalArgumentException("이미 사용중인 아이디 입니다.");
        }

        Member member = Member.builder()
                .memberId(request.getMemberId())
                .userId(request.getUserId())
                .name(request.getName())
                .password(request.getPassword())
                .birthday(request.getBirthday())
                .email(request.getEmail())
                .phone(request.getPhone())
                .userType((byte) 1)
                .signdate(LocalDate.from(LocalDateTime.now()))
                .terms((byte) 0)
                .build();

        memberRepository.save(member);
    }
}
