import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure VariationalStructurePackage where
  functionalSpace : Type u
  bilinearForm : Prop
  weakFormulation : Prop
  coercivity : Prop
  boundedness : Prop

structure VariationalStructureEvidence (V : VariationalStructurePackage) where
  bilinearFormClosed : V.bilinearForm
  weakFormulationClosed : V.weakFormulation
  coercivityClosed : V.coercivity
  boundednessClosed : V.boundedness

def VariationalStructureClosed (V : VariationalStructurePackage) : Prop :=
  V.bilinearForm ∧ V.weakFormulation ∧ V.coercivity ∧ V.boundedness

theorem variational_structure_closed_from_evidence (V : VariationalStructurePackage) (E : VariationalStructureEvidence V) : VariationalStructureClosed V := by
  exact And.intro E.bilinearFormClosed (And.intro E.weakFormulationClosed (And.intro E.coercivityClosed E.boundednessClosed))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse