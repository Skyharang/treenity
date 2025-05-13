package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "bookmark")
public class Bookmark {
    @Id
    @Column(name = "bookmark_num", nullable = false)
    private String bookmarkNum;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "member_num", nullable = false)
    private com.treenity.tree.domain.Member memberNum;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "plant_num", nullable = false)
    private com.treenity.tree.domain.Plant plantNum;

}