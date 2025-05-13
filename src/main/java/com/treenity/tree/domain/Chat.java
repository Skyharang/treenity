package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "chat")
public class Chat {
    @Id
    @Column(name = "room_num", nullable = false)
    private String roomNum;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "board_num", nullable = false)
    private Board boardNum;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "member1", nullable = false)
    private com.treenity.tree.domain.Member member1;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "member2", nullable = false)
    private com.treenity.tree.domain.Member member2;

}