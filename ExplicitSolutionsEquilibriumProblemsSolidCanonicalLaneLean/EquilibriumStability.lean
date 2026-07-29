import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure EquilibriumStabilityPackage where
  equilibriumPoint : Type u
  linearization : Prop
  eigenvalueCondition : Prop
  stabilityMargin : Prop
  bifurcationAnalysis : Prop

structure EquilibriumStabilityEvidence (S : EquilibriumStabilityPackage) where
  linearizationClosed : S.linearization
  eigenvalueConditionClosed : S.eigenvalueCondition
  stabilityMarginClosed : S.stabilityMargin
  bifurcationAnalysisClosed : S.bifurcationAnalysis

def EquilibriumStabilityClosed (S : EquilibriumStabilityPackage) : Prop :=
  S.linearization ∧ S.eigenvalueCondition ∧ S.stabilityMargin ∧ S.bifurcationAnalysis

theorem equilibrium_stability_closed_from_evidence (S : EquilibriumStabilityPackage) (E : EquilibriumStabilityEvidence S) : EquilibriumStabilityClosed S := by
  exact And.intro E.linearizationClosed (And.intro E.eigenvalueConditionClosed (And.intro E.stabilityMarginClosed E.bifurcationAnalysisClosed))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse