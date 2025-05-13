package com.treenity.tree.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "species")
public class Species {
    @Id
    @Column(name = "species_num", nullable = false)
    private String speciesNum;

    @Column(name = "species_name", nullable = false)
    private String speciesName;

}