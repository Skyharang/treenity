package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;
import java.util.Set;


@Entity
@Getter
@Setter
public class Plant {

    @Id
    @GeneratedValue(generator = "uuid")
    @Column(nullable = false, updatable = false)
    private String number;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String home;

    @Column(nullable = false)
    private String text;

    @Column(nullable = false)
    private String environment;

    @Column(nullable = false)
    private String photo;

    @Column(nullable = false)
    private OffsetDateTime water;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tp_number_id", nullable = false)
    private PlantType tpNumber;

    @OneToMany(mappedBy = "bkNumber")
    private Set<Grow> bkNumberGrows;

    @OneToMany(mappedBy = "tpNumber")
    private Set<Grow> tpNumberGrows;

    @OneToMany(mappedBy = "bkNumber")
    private Set<Bookmark> bkNumberBookmarks;

    @OneToMany(mappedBy = "tpNumber")
    private Set<Bookmark> tpNumberBookmarks;


}
