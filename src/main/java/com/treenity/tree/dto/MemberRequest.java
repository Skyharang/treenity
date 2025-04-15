package com.treenity.tree.dto;

import com.treenity.tree.domain.Member;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MemberRequest {

    private UUID memberId;

    private String userId;

    private String name;

    private String password;

    private String birthday;

    private String email;

    private String phone;



}
