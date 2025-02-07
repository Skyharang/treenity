package com.treenity.tree.type;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum MemberType {
        USER("회원"),
        ADMIN("관리자");

        private final String description;
}
