import ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure AdmissibleClass where
  object : SolidEquilibriumAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  SolidEquilibriumWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
