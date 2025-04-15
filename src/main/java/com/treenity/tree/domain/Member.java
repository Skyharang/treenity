package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "member")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class Member {

    @Id
    @GeneratedValue(generator = "uuid")
    @Column(name = "member_id", nullable = false)
    private UUID memberId;

    @Column(name = "user_id", nullable = false)
    @NonNull
    private String userId;

    @Column(name = "name", nullable = false)
    @NonNull
    private String name;

    @Column(name = "password", nullable = false)
    @NonNull
    private String password;

    @Column(name = "birthday", nullable = false)
    @NonNull
    private String birthday;

    @Column(name = "email", nullable = false)
    @NonNull
    private String email;

    @Column(name = "phone", nullable = false)
    @NonNull
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

}