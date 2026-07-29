import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure EquilibriumExistencePackage {P : SolidEquilibriumVariationalPackage}
    {V : SolidEquilibriumVariationalEvidence P}
    {S : SemiAnalyticSolutionPackage V} (T : SemiAnalyticSolutionEvidence S) where
  coercivityCondition : Prop
  bilinearFormBounded : Prop
  linearFormBounded : Prop
  laxMilgramApplicable : Prop
  existenceProved : Prop
  uniquenessProved : Prop
  stabilityEstimate : Prop

structure EquilibriumExistenceEvidence {P : SolidEquilibriumVariationalPackage}
    {V : SolidEquilibriumVariationalEvidence P}
    {S : SemiAnalyticSolutionPackage V} {T : SemiAnalyticSolutionEvidence S}
    (E : EquilibriumExistencePackage T) where
  coercivityConditionClosed : E.coercivityCondition
  bilinearFormBoundedClosed : E.bilinearFormBounded
  linearFormBoundedClosed : E.linearFormBounded
  laxMilgramApplicableClosed : E.laxMilgramApplicable
  existenceProvedClosed : E.existenceProved
  uniquenessProvedClosed : E.uniquenessProved
  stabilityEstimateClosed : E.stabilityEstimate

def EquilibriumExistenceClosed {P : SolidEquilibriumVariationalPackage}
    {V : SolidEquilibriumVariationalEvidence P}
    {S : SemiAnalyticSolutionPackage V} {T : SemiAnalyticSolutionEvidence S}
    (E : EquilibriumExistencePackage T) : Prop :=
  E.coercivityCondition ∧ E.bilinearFormBounded ∧ E.linearFormBounded ∧
  E.laxMilgramApplicable ∧ E.existenceProved ∧ E.uniquenessProved ∧ E.stabilityEstimate

theorem equilibrium_existence_closed_from_evidence
    {P : SolidEquilibriumVariationalPackage} {V : SolidEquilibriumVariationalEvidence P}
    {S : SemiAnalyticSolutionPackage V} {T : SemiAnalyticSolutionEvidence S}
    (E : EquilibriumExistencePackage T) (Ev : EquilibriumExistenceEvidence E) :
    EquilibriumExistenceClosed E := by
  exact And.intro Ev.coercivityConditionClosed
    (And.intro Ev.bilinearFormBoundedClosed
      (And.intro Ev.linearFormBoundedClosed
        (And.intro Ev.laxMilgramApplicableClosed
          (And.intro Ev.existenceProvedClosed
            (And.intro Ev.uniquenessProvedClosed Ev.stabilityEstimateClosed)))))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
