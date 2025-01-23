package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;
import java.util.Set;


@Entity
@Getter
@Setter
public class Board {

    @Id
    @GeneratedValue(generator = "uuid")
    @Column(nullable = false, updatable = false)
    private String number;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private String text;

    @Column(nullable = false)
    private String photo;

    @Column(nullable = false)
    private OffsetDateTime date;

    @Column(nullable = false)
    private String category;

    @Column(nullable = false)
    private OffsetDateTime trash;

    @Column(nullable = false)
    private Integer price;

    @Column(nullable = false)
    private String why;

    @Column
    private String reply;

    @Column(nullable = false)
    private Integer love;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id", nullable = false)
    private Member member;

    @OneToMany(mappedBy = "bdNumber")
    private Set<Chat> bdNumberChats;

    @OneToMany(mappedBy = "wrNumber")
    private Set<Chat> wrNumberChats;

    @OneToMany(mappedBy = "bdNumber")
    private Set<Star> bdNumberStars;

    @OneToMany(mappedBy = "wrNumber")
    private Set<Star> wrNumberStars;

    @OneToMany(mappedBy = "bdNumber")
    private Set<Sos> bdNumberSoses;

    @OneToMany(mappedBy = "wrNumber")
    private Set<Sos> wrNumberSoses;



}
