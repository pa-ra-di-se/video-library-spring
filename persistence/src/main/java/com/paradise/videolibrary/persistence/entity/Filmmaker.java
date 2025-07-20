package com.paradise.videolibrary.persistence.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.envers.Audited;
import org.hibernate.envers.NotAudited;
import org.hibernate.envers.RelationTargetAuditMode;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@EqualsAndHashCode(exclude = {"filmmakerMovie", "filmmakerProfessions"}, callSuper = false)
@ToString(exclude = {"filmmakerMovie", "filmmakerProfessions"})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
@Table(name = "filmmaker")
public class Filmmaker extends AuditingEntity<Long> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String firstname;

    @Column(nullable = false, unique = true)
    private String lastname;

    @Column(nullable = false, unique = true)
    private LocalDate birthday;

    @NotAudited
    @Builder.Default
    @OneToMany(mappedBy = "filmmaker")
    private List<FilmmakerMovie> filmmakerMovie = new ArrayList<>();

    @NotAudited
    @Builder.Default
    @OneToMany(mappedBy = "filmmaker")
    private List<FilmmakerProfession> filmmakerProfessions = new ArrayList<>();
}
