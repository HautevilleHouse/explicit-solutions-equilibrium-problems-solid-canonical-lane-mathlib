import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure NonlinearElasticityModel where
  referenceConfiguration : Type u
  deformationGradient : Prop
  strainEnergyDensity : Prop
  equilibriumEquation : Prop
  constitutiveLaw : Prop

structure NonlinearElasticityEvidence (M : NonlinearElasticityModel) where
  deformationGradientClosed : M.deformationGradient
  strainEnergyDensityClosed : M.strainEnergyDensity
  equilibriumEquationClosed : M.equilibriumEquation
  constitutiveLawClosed : M.constitutiveLaw

def NonlinearElasticityClosed (M : NonlinearElasticityModel) : Prop :=
  M.deformationGradient ∧ M.strainEnergyDensity ∧ M.equilibriumEquation ∧ M.constitutiveLaw

theorem nonlinear_elasticity_closed_from_evidence (M : NonlinearElasticityModel) (E : NonlinearElasticityEvidence M) : NonlinearElasticityClosed M := by
  exact And.intro E.deformationGradientClosed (And.intro E.strainEnergyDensityClosed (And.intro E.equilibriumEquationClosed E.constitutiveLawClosed))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse