import ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean.SolutionExistenceModel

/-!
# Equilibrium System Classification Package
-/

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure EquilibriumSystemClassificationPackage {E : ExplicitSolutionSolidModelPackage}
    (S : SolutionExistenceModelPackage E) where
  systemTypeClassified : Prop
  explicitSolutionForm : Prop
  equilibriumParameterized : Prop
  stabilityCondition : Prop

structure EquilibriumSystemClassificationEvidence {E : ExplicitSolutionSolidModelPackage}
    {S : SolutionExistenceModelPackage E}
    (C : EquilibriumSystemClassificationPackage S) where
  systemTypeClassifiedClosed : C.systemTypeClassified
  explicitSolutionFormClosed : C.explicitSolutionForm
  equilibriumParameterizedClosed : C.equilibriumParameterized
  stabilityConditionClosed : C.stabilityCondition

def EquilibriumSystemClassificationClosed {E : ExplicitSolutionSolidModelPackage}
    {S : SolutionExistenceModelPackage E}
    (C : EquilibriumSystemClassificationPackage S) : Prop :=
  C.systemTypeClassified ∧ C.explicitSolutionForm ∧
  C.equilibriumParameterized ∧ C.stabilityCondition

theorem equilibrium_system_classification_closed_from_evidence
    {E : ExplicitSolutionSolidModelPackage} {S : SolutionExistenceModelPackage E}
    (C : EquilibriumSystemClassificationPackage S)
    (Ev : EquilibriumSystemClassificationEvidence C) : EquilibriumSystemClassificationClosed C := by
  exact And.intro Ev.systemTypeClassifiedClosed
    (And.intro Ev.explicitSolutionFormClosed
      (And.intro Ev.equilibriumParameterizedClosed Ev.stabilityConditionClosed))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
