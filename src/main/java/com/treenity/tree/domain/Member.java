package com.treenity.tree.domain;

import com.treenity.tree.type.MemberType;
import com.treenity.tree.type.TermsAgreeType;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EntityListeners(AuditingEntityListener.class)
public class Member {

    @Id
    @GeneratedValue(generator = "uuid")
    @Column(nullable = false, updatable = false)
    private String memberId;

    @Column(nullable = false)
    private String id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String pw;

    @Column(nullable = false)
    private LocalDateTime birthday;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String phone;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private MemberType memberType;

    @Column(nullable = false)
    private LocalDateTime signDate;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private TermsAgreeType terms;

    // 위도
    @Column(nullable = false)
    private Integer latitude;

    // 경도
    @Column(nullable = false)
    private Integer longitude;






    @OneToMany(mappedBy = "number")
    private Set<Grow> numberGrows;

    @OneToMany(mappedBy = "member")
    private Set<Board> memberBoards;

    @OneToMany(mappedBy = "member")
    private Set<Chat> memberChats;

    @OneToMany(mappedBy = "member")
    private Set<Bookmark> memberBookmarks;

    @OneToMany(mappedBy = "member")
    private Set<Qa> memberQas;

    @OneToMany(mappedBy = "member")
    private Set<Star> memberStars;

    @OneToMany(mappedBy = "member")
    private Set<Sos> memberSoses;

}
