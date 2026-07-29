import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean.ExplicitSolutionsCore

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure StressStrainPackage (S : EquilibriumSolidSystem) where
  stressTensor : S.configSpace → ℝ
  strainTensor : S.configSpace → ℝ
  constitutiveLaw : Prop
  equilibriumStress : Prop

structure StressStrainEvidence (S : EquilibriumSolidSystem) (T : StressStrainPackage S) where
  stressTensorClosed : True
  strainTensorClosed : True
  constitutiveLawClosed : T.constitutiveLaw
  equilibriumStressClosed : T.equilibriumStress

def StressStrainClosed (S : EquilibriumSolidSystem) (T : StressStrainPackage S) : Prop :=
  T.constitutiveLaw ∧ T.equilibriumStress

theorem stress_strain_closed_from_evidence (S : EquilibriumSolidSystem) (T : StressStrainPackage S) (E : StressStrainEvidence S T) : StressStrainClosed S T := by
  exact And.intro E.constitutiveLawClosed E.equilibriumStressClosed

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse