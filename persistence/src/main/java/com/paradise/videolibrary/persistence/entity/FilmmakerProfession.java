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
@Table(name = "filmmaker_profession")
public class FilmmakerProfession extends AuditingEntity<Long> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "filmmaker_id")
    private Filmmaker filmmaker;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "profession_id")
    private Profession profession;

    public void setFilmmaker(Filmmaker filmmaker) {
        this.filmmaker = filmmaker;
        this.filmmaker.getFilmmakerProfessions().add(this);
    }

    public void setMovie(Profession profession) {
        this.profession = profession;
        this.profession.getFilmmakerProfessions().add(this);
    }
}
