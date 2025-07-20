package com.paradise.videolibrary.persistence.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.envers.Audited;
import org.hibernate.envers.NotAudited;
import org.hibernate.envers.RelationTargetAuditMode;

import java.util.ArrayList;
import java.util.List;

@EqualsAndHashCode(of = "profession", callSuper = false)
@ToString(exclude = {"filmmakerProfessions"})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
@Table(name = "profession")
public class Profession extends AuditingEntity<Integer> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, unique = true)
    private String profession;

    @NotAudited
    @Builder.Default
    @OneToMany(mappedBy = "profession")
    private List<FilmmakerProfession> filmmakerProfessions = new ArrayList<>();
}
