package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "pick")
public class Pick {
    @Id
    @Column(name = "pick_num", nullable = false)
    private String pickNum;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "member_num", nullable = false)
    private Member memberNum;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "board_num", nullable = false)
    private Board boardNum;

}