import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure MaterialInterfacePackage where
  interfaceGeometry : Type u
  continuityCondition : Prop
  jumpCondition : Prop
  transmissionCondition : Prop
  interfaceLaw : Prop

structure MaterialInterfaceEvidence (I : MaterialInterfacePackage) where
  continuityConditionClosed : I.continuityCondition
  jumpConditionClosed : I.jumpCondition
  transmissionConditionClosed : I.transmissionCondition
  interfaceLawClosed : I.interfaceLaw

def MaterialInterfaceClosed (I : MaterialInterfacePackage) : Prop :=
  I.continuityCondition ∧ I.jumpCondition ∧ I.transmissionCondition ∧ I.interfaceLaw

theorem material_interface_closed_from_evidence (I : MaterialInterfacePackage) (E : MaterialInterfaceEvidence I) : MaterialInterfaceClosed I := by
  exact And.intro E.continuityConditionClosed (And.intro E.jumpConditionClosed (And.intro E.transmissionConditionClosed E.interfaceLawClosed))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse