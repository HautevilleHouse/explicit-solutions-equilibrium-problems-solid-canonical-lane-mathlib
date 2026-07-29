import ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean.EquilibriumSystemClassification

/-!
# Solid Mechanics Equilibrium Model Package
-/

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure SolidMechanicsEquilibriumModelPackage {E : ExplicitSolutionSolidModelPackage}
    {S : SolutionExistenceModelPackage E}
    (C : EquilibriumSystemClassificationPackage S) where
  constitutiveLaw : Prop
  stressEquilibrium : Prop
  boundaryCondition : Prop
  displacementFieldExplicit : Prop

structure SolidMechanicsEquilibriumModelEvidence {E : ExplicitSolutionSolidModelPackage}
    {S : SolutionExistenceModelPackage E}
    {C : EquilibriumSystemClassificationPackage S}
    (M : SolidMechanicsEquilibriumModelPackage C) where
  constitutiveLawClosed : M.constitutiveLaw
  stressEquilibriumClosed : M.stressEquilibrium
  boundaryConditionClosed : M.boundaryCondition
  displacementFieldExplicitClosed : M.displacementFieldExplicit

def SolidMechanicsEquilibriumModelClosed {E : ExplicitSolutionSolidModelPackage}
    {S : SolutionExistenceModelPackage E}
    {C : EquilibriumSystemClassificationPackage S}
    (M : SolidMechanicsEquilibriumModelPackage C) : Prop :=
  M.constitutiveLaw ∧ M.stressEquilibrium ∧
  M.boundaryCondition ∧ M.displacementFieldExplicit

theorem solid_mechanics_equilibrium_model_closed_from_evidence
    {E : ExplicitSolutionSolidModelPackage} {S : SolutionExistenceModelPackage E}
    {C : EquilibriumSystemClassificationPackage S}
    (M : SolidMechanicsEquilibriumModelPackage C)
    (Ev : SolidMechanicsEquilibriumModelEvidence M) : SolidMechanicsEquilibriumModelClosed M := by
  exact And.intro Ev.constitutiveLawClosed
    (And.intro Ev.stressEquilibriumClosed
      (And.intro Ev.boundaryConditionClosed Ev.displacementFieldExplicitClosed))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
