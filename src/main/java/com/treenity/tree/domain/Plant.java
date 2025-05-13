package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "plant")
public class Plant {
    @Id
    @Column(name = "plant_num", nullable = false)
    private String plantNum;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "species_num", nullable = false)
    private com.treenity.tree.domain.Species speciesNum;

    @Column(name = "plant_name", nullable = false)
    private String plantName;

    @Column(name = "`explain`", nullable = false)
    private String explain;

    @Column(name = "habitat", nullable = false)
    private String habitat;

    @Column(name = "enviroment", nullable = false)
    private String enviroment;

    @Column(name = "image", nullable = false)
    private String image;

    @Column(name = "cycle", nullable = false)
    private String cycle;

}