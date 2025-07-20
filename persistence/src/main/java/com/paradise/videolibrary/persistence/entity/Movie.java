package com.paradise.videolibrary.persistence.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.envers.Audited;
import org.hibernate.envers.NotAudited;
import org.hibernate.envers.RelationTargetAuditMode;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@EqualsAndHashCode(of = "title", callSuper = false)
@ToString(exclude = {"reviews", "filmmakerMovie"})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "movie")
@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
public class Movie extends AuditingEntity<Long> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String title;

    private LocalDate release;

    private String country;

    private String genre;

    @NotAudited
    @Builder.Default
    @OneToMany(mappedBy = "movie")
    private List<Review> reviews = new ArrayList<>();

    @NotAudited
    @Builder.Default
    @OneToMany(mappedBy = "movie")
    private List<FilmmakerMovie> filmmakerMovie = new ArrayList<>();
}
