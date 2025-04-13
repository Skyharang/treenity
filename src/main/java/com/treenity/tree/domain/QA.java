package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

@Getter
@Setter
@Entity
@Table(name = "`Q&A`")
public class QA {
    @Id
    @Column(name = "qna_num", nullable = false)
    private String qnaNum;

    @Column(name = "qna_title", nullable = false)
    private String qnaTitle;

    @ColumnDefault("(0)")
    @Column(name = "qna_category", nullable = false)
    private Integer qnaCategory;

    @ColumnDefault("(0)")
    @Column(name = "qna_text", nullable = false)
    private Integer qnaText;

    @ColumnDefault("0")
    @Column(name = "complete_yn", nullable = false)
    private Byte completeYn;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "member_num", nullable = false)
    private com.treenity.tree.domain.Member memberNum;

}