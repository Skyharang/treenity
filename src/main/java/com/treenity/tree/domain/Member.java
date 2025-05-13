package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import java.util.UUID;
import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "member")
public class Member {
    @Id
    @Column(name = "member_id", nullable = false)
    private String memberId;

    @Column(name = "user_id", nullable = false)
    private String userId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "birthday", nullable = false)
    private String birthday;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "phone", nullable = false)
    private String phone;

    @ColumnDefault("1")
    @Column(name = "user_type", nullable = false)
    private Byte userType;

    @Column(name = "signdate", nullable = false)
    private LocalDate signdate;

    @ColumnDefault("0")
    @Column(name = "terms", nullable = false)
    private Byte terms;

    @Column(name = "latitude")
    private Integer latitude;

    @Column(name = "longlatitude")
    private Integer longlatitude;


    @PrePersist
    public void onPrePersist() {
        if (this.memberId == null) {
            //UUID 생성 후 문자열로 변환
            this.memberId = UUID.randomUUID().toString();
        }
    }
}