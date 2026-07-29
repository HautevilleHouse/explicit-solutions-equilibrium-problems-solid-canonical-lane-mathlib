import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure SolidMechanicsConstitutivePackage where
  strainType : Type u
  stressType : Type u
  constitutiveLaw : strainType -> stressType
  equilibriumEquation : Prop
  solutionRegularity : Prop

structure SolidMechanicsConstitutiveEvidence (S : SolidMechanicsConstitutivePackage) where
  equilibriumEquationClosed : S.equilibriumEquation
  solutionRegularityClosed : S.solutionRegularity

def SolidMechanicsConstitutiveClosed (S : SolidMechanicsConstitutivePackage) : Prop :=
  S.equilibriumEquation ∧ S.solutionRegularity

theorem solid_mechanics_constitutive_closed_from_evidence (S : SolidMechanicsConstitutivePackage)
    (E : SolidMechanicsConstitutiveEvidence S) : SolidMechanicsConstitutiveClosed S := by
  exact And.intro E.equilibriumEquationClosed E.solutionRegularityClosed

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
