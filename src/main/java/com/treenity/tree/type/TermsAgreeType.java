package com.treenity.tree.type;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum TermsAgreeType {
    AGREE("약관 동의"),
    DISAGREE("약관 비동의");

    private final String state;
}
