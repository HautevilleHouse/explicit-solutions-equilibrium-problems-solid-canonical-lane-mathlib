import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean.ExplicitSolutionsCore

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure VariationalPrinciple (S : EquilibriumSolidSystem) where
  functional : S.configSpace → ℝ
  eulerLagrangeEquation : Prop
  explicitSolutionAsCriticalPoint : Prop

structure VariationalEvidence (S : EquilibriumSolidSystem) (V : VariationalPrinciple S) where
  functionalClosed : True
  eulerLagrangeEquationClosed : V.eulerLagrangeEquation
  explicitSolutionAsCriticalPointClosed : V.explicitSolutionAsCriticalPoint

def VariationalClosed (S : EquilibriumSolidSystem) (V : VariationalPrinciple S) : Prop :=
  V.eulerLagrangeEquation ∧ V.explicitSolutionAsCriticalPoint

theorem variational_closed_from_evidence (S : EquilibriumSolidSystem) (V : VariationalPrinciple S) (E : VariationalEvidence S V) : VariationalClosed S V := by
  exact And.intro E.eulerLagrangeEquationClosed E.explicitSolutionAsCriticalPointClosed

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse