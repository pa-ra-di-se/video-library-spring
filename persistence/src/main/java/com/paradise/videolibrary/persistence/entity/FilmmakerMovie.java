package com.paradise.videolibrary.persistence.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;

@EqualsAndHashCode(callSuper = false)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
@Table(name = "filmmaker_movie")
public class FilmmakerMovie extends AuditingEntity<Long> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "movie_id")
    private Movie movie;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "filmmaker_id")
    private Filmmaker filmmaker;

    public void setMovie(Movie movie) {
        this.movie = movie;
        this.movie.getFilmmakerMovie().add(this);
    }

    public void setFilmmaker(Filmmaker filmmaker) {
        this.filmmaker = filmmaker;
        this.filmmaker.getFilmmakerMovie().add(this);
    }
}
