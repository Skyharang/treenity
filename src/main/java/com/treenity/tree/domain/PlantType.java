package com.treenity.tree.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Set;


@Entity
@Getter
@Setter
public class PlantType {

    @Id
    @GeneratedValue(generator = "uuid")
    @Column(nullable = false, updatable = false)
    private String number;

    @Column(nullable = false)
    private String name;

    @OneToMany(mappedBy = "tpNumber")
    private Set<Plant> tpNumberPlants;

}
