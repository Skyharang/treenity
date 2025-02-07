package com.treenity.tree.dto;

import com.treenity.tree.domain.Member;
import com.treenity.tree.type.MemberType;
import com.treenity.tree.type.TermsAgreeType;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import jakarta.validation.constraints.Size;

public class CreateMember {

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @Builder
    @ToString
    public static class Request {
        @NotNull
        @Size(min = 6, max = 15, message = "아이디는 최소 7자 최대 15자 입니다.")
        private String id;

        @NotNull
        private String name;

        @NotNull
        @Size(min = 9, max = 20, message = "비밀번호는 최소 9자 최대 20자 입니다.")
        private String pw;

        @NotNull
        private LocalDateTime birthday;

        @NotNull
        private String email;

        @NotNull
        private String phone;

        @NotNull
        private MemberType memberType;

        @NotNull
        private LocalDateTime signDate;

        @NotNull
        private TermsAgreeType terms;

    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @Builder
    public static class Response {
        private String id;
        private String name;
        private String email;
        private String phone;

        public static Response fromEntity(@NotNull Member member) {
            return Response.builder()
                    .id(member.getId())
                    .name(member.getName())
                    .email(member.getEmail())
                    .phone(member.getPhone())
                    .build();
        }
    }
}
