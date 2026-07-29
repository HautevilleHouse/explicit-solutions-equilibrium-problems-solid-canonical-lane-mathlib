import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure NonlinearElasticityPackage where
  referenceConfiguration : Type u
  strainEnergyDensity : Type v
  equilibriumEquations : Type w
  boundaryConditions : Type x
  hyperelasticMaterial : Prop
  stressFreeState : Prop
  equilibriumSolvable : Prop
  solutionExplicitForm : Prop

structure NonlinearElasticityEvidence (N : NonlinearElasticityPackage) where
  hyperelasticMaterialClosed : N.hyperelasticMaterial
  stressFreeStateClosed : N.stressFreeState
  equilibriumSolvableClosed : N.equilibriumSolvable
  solutionExplicitFormClosed : N.solutionExplicitForm

def NonlinearElasticityClosed (N : NonlinearElasticityPackage) : Prop :=
  N.hyperelasticMaterial ∧ N.stressFreeState ∧ N.equilibriumSolvable ∧ N.solutionExplicitForm

theorem nonlinear_elasticity_closed_from_evidence (N : NonlinearElasticityPackage) (E : NonlinearElasticityEvidence N) : NonlinearElasticityClosed N := by
  exact And.intro E.hyperelasticMaterialClosed (And.intro E.stressFreeStateClosed (And.intro E.equilibriumSolvableClosed E.solutionExplicitFormClosed))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
