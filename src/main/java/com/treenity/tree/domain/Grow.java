package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;


@Entity
@Getter
@Setter
public class Grow {

    @Id
    @GeneratedValue(generator = "uuid")
    @Column(nullable = false, updatable = false)
    private String number;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String category;

    @Column(nullable = false)
    private OffsetDateTime date;

    @Column(nullable = false)
    private String photo;

    @Column(nullable = false)
    private Integer water;

    @Column
    private Integer alam;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bk_number_id", nullable = false)
    private Plant bkNumber;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tp_number_id", nullable = false)
    private Plant tpNumber;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "number_id", nullable = false)
    private Member member;


}
