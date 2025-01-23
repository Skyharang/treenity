package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;
import java.util.Set;


@Entity
@Getter
@Setter
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
    private String birthday;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String phone;

    @Column(nullable = false)
    private Integer admin;

    @Column(nullable = false)
    private OffsetDateTime date;

    @Column(nullable = false)
    private Integer person;

    @Column(nullable = false)
    private Integer gps;

    @Column(nullable = false)
    private Integer gps1;

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
