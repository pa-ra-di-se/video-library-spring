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
@Table(name = "review")
@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
public class Review extends AuditingEntity<Long> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "movie_id")
    private Movie movie;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Column(unique = true)
    private String content;

    private Integer grade;

    public void setUser(User user) {
        this.user = user;
        this.user.getReviews().add(this);
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
        this.movie.getReviews().add(this);
    }
}
