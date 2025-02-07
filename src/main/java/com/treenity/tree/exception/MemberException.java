package com.treenity.tree.exception;

import lombok.Getter;

@Getter
public class MemberException extends RuntimeException {

    private MemberErrorCode memberErrorCode;
    private String detailMessage;

    public MemberException(MemberErrorCode errorCode) {
        super(errorCode.getMessage());
        this.memberErrorCode = errorCode;
        this.detailMessage = errorCode.getMessage();
    }

    public MemberException(MemberErrorCode errorCode, String detailMessage) {
        super(errorCode.getMessage());
        this.memberErrorCode = errorCode;
        this.detailMessage = detailMessage;
    }
}
