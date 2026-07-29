import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure SolidEquilibriumVariationalPackage where
  displacementField : Type u
  strainTensor : Type v
  stressTensor : Type w
  bodyForce : Type x
  boundaryTraction : Type y
  variationalEquilibrium : Prop
  constitutiveLaw : Prop
  kinematicCompatibility : Prop
  boundaryConditionsApplied : Prop
  weakFormulationSatisfied : Prop

structure SolidEquilibriumVariationalEvidence (P : SolidEquilibriumVariationalPackage) where
  variationalEquilibriumClosed : P.variationalEquilibrium
  constitutiveLawClosed : P.constitutiveLaw
  kinematicCompatibilityClosed : P.kinematicCompatibility
  boundaryConditionsAppliedClosed : P.boundaryConditionsApplied
  weakFormulationSatisfiedClosed : P.weakFormulationSatisfied

def SolidEquilibriumVariationalClosed (P : SolidEquilibriumVariationalPackage) : Prop :=
  P.variationalEquilibrium ∧ P.constitutiveLaw ∧ P.kinematicCompatibility ∧
  P.boundaryConditionsApplied ∧ P.weakFormulationSatisfied

theorem solid_equilibrium_variational_closed_from_evidence
    (P : SolidEquilibriumVariationalPackage) (E : SolidEquilibriumVariationalEvidence P) :
    SolidEquilibriumVariationalClosed P := by
  exact And.intro E.variationalEquilibriumClosed
    (And.intro E.constitutiveLawClosed
      (And.intro E.kinematicCompatibilityClosed
        (And.intro E.boundaryConditionsAppliedClosed E.weakFormulationSatisfiedClosed)))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
