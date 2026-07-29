import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure EquilibriumVariationalPackage where
  stateVariable : Type u
  energyFunctional : stateVariable -> ℝ
  constraintSet : Set stateVariable
  equilibriumCondition : Prop
  existenceResult : Prop

structure EquilibriumVariationalEvidence (P : EquilibriumVariationalPackage) where
  equilibriumConditionClosed : P.equilibriumCondition
  existenceResultClosed : P.existenceResult

def EquilibriumVariationalClosed (P : EquilibriumVariationalPackage) : Prop :=
  P.equilibriumCondition ∧ P.existenceResult

theorem equilibrium_variational_closed_from_evidence (P : EquilibriumVariationalPackage)
    (E : EquilibriumVariationalEvidence P) : EquilibriumVariationalClosed P := by
  exact And.intro E.equilibriumConditionClosed E.existenceResultClosed

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
