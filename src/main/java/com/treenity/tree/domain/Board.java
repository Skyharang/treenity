package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "board")
public class Board {
    @Id
    @Column(name = "board_num", nullable = false)
    private String boardNum;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "member_num", nullable = false)
    private com.treenity.tree.domain.Member memberNum;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "text", nullable = false)
    private String text;

    @Column(name = "image")
    private String image;

    @Column(name = "created_at", nullable = false)
    private Instant createdAt;

    @ColumnDefault("(0)")
    @Column(name = "category", nullable = false)
    private Integer category;

    @ColumnDefault("(0)")
    @Column(name = "deleted_at", nullable = false)
    private Instant deletedAt;

    @ColumnDefault("(0)")
    @Column(name = "price")
    private Integer price;

    @ColumnDefault("(0)")
    @Column(name = "likes")
    private Integer likes;

}