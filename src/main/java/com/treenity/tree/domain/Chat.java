package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;


@Entity
@Getter
@Setter
public class Chat {

    @Id
    @GeneratedValue(generator = "uuid")
    @Column(nullable = false, updatable = false)
    private String number;

    @Column(nullable = false)
    private String detail;

    @Column(nullable = false)
    private OffsetDateTime time;

    @Column(nullable = false)
    private String photo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id", nullable = false)
    private Member member;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bd_number_id", nullable = false)
    private Board bdNumber;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "wr_number_id", nullable = false)
    private Board wrNumber;



}
