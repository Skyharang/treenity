package com.treenity.tree.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum MemberErrorCode {
        NO_MEMBER("해당되는 회원이 없습니다."),
        DUPLICATEED_MEMBER_ID("아이디가 중복된 회원이 있습니다."),
        PASSWORD_UNMATCHED("해당 아이디의 비밀번호가 일치하지 않습니다."),


        INTERNEAL_SERVER_ERROR("서버에 오류가 발생했습니다"),
        INVALID_REQUEST("잘못된 요청입니다.");

        private final String message;
}
