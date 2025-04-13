package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "report")
public class Report {
    @Id
    @Column(name = "report_num", nullable = false)
    private String reportNum;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "board_num", nullable = false)
    private Board boardNum;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "member_num", nullable = false)
    private Member memberNum;

    @Column(name = "report_text", nullable = false)
    private String reportText;

    @Column(name = "reported_at", nullable = false)
    private Instant reportedAt;

}