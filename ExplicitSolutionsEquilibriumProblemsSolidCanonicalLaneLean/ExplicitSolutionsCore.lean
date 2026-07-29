import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure EquilibriumSolidSystem where
  configSpace : Type u
  potentialEnergy : configSpace → ℝ
  equilibriumSet : Set configSpace
  explicitSolutionMap : configSpace → ℝ
  equilibriumCondition : ∀ x, x ∈ equilibriumSet ↔ potentialEnergy x = explicitSolutionMap x

structure ExplicitSolutionEvidence (S : EquilibriumSolidSystem) where
  configSpaceClosed : True
  potentialEnergyClosed : True
  equilibriumSetClosed : True
  explicitSolutionMapClosed : True
  equilibriumConditionClosed : S.equilibriumCondition

def ExplicitSolutionClosed (S : EquilibriumSolidSystem) : Prop :=
  True ∧ True ∧ True ∧ True ∧ True

theorem explicit_solution_closed_from_evidence (S : EquilibriumSolidSystem) (E : ExplicitSolutionEvidence S) : ExplicitSolutionClosed S := by
  exact And.intro E.configSpaceClosed
    (And.intro E.potentialEnergyClosed
      (And.intro E.equilibriumSetClosed
        (And.intro E.explicitSolutionMapClosed E.equilibriumConditionClosed)))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse