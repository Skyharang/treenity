package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "grow")
public class Grow {
    @Id
    @Column(name = "grow_num", nullable = false)
    private String growNum;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "member_num", nullable = false)
    private com.treenity.tree.domain.Member memberNum;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "plant_num", nullable = false)
    private com.treenity.tree.domain.Plant plantNum;

    @Column(name = "nickname", nullable = false)
    private String nickname;

    @Column(name = "category", nullable = false)
    private String category;

    @Column(name = "started_at", nullable = false)
    private LocalDate startedAt;

    @Column(name = "image")
    private String image;

    @Column(name = "water")
    private String water;

    @ColumnDefault("0")
    @Column(name = "alam", nullable = false)
    private Byte alam;

}