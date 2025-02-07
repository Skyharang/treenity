package com.treenity.tree.service;

import com.treenity.tree.domain.Member;
import com.treenity.tree.dto.CreateMember;
import com.treenity.tree.exception.MemberException;
import com.treenity.tree.repository.MemberRepository;
import com.treenity.tree.type.MemberType;
import com.treenity.tree.type.TermsAgreeType;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

import static com.treenity.tree.exception.MemberErrorCode.DUPLICATEED_MEMBER_ID;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberRepository memberRepository;

    @Transactional
    public CreateMember.Response createMember(
            CreateMember.Request request
    ) {
        // 해당 아이디가 존재하는 지 검증
        validateCreateMemberRequest(request);

        // 객체 생성 후 변수에 담음
        Member member = createMemberFromRequest(request);
        memberRepository.save(member);
        return CreateMember.Response.fromEntity(member);
    }

    // builder로 객체 생성
    private Member createMemberFromRequest(CreateMember.Request request) {
        return Member.builder()
                .id(request.getId())
                .name(request.getName())
                .pw(request.getPw())
                .birthday(request.getBirthday())
                .email(request.getEmail())
                .phone(request.getPhone())
                .memberType(MemberType.USER)
                .signDate(LocalDateTime.now())
                .terms(TermsAgreeType.AGREE)
                .build();
    }

    // 해당 아이디가 존재하는 지 검증
    private void validateCreateMemberRequest(@NotNull CreateMember.Request request) {
        memberRepository.findById(request.getId())
                .ifPresent(member -> {
                    throw new MemberException(DUPLICATEED_MEMBER_ID);
                });
    }
}
