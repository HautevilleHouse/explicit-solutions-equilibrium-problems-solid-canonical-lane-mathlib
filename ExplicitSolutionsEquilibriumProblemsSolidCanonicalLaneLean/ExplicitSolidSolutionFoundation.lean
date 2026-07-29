import ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean.SolidMechanicsEquilibriumModel

/-!
# Explicit Solid Solution Foundation
-/

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure ExplicitSolidSolutionFoundation where
  solidModel : ExplicitSolutionSolidModelPackage
  solidModelEvidence : ExplicitSolutionSolidModelEvidence solidModel
  solutionExistence : SolutionExistenceModelPackage solidModel
  solutionExistenceEvidence : SolutionExistenceModelEvidence solutionExistence
  equilibriumClassification : EquilibriumSystemClassificationPackage solutionExistence
  equilibriumClassificationEvidence : EquilibriumSystemClassificationEvidence equilibriumClassification
  solidMechanicsEquilibrium : SolidMechanicsEquilibriumModelPackage equilibriumClassification
  solidMechanicsEquilibriumEvidence : SolidMechanicsEquilibriumModelEvidence solidMechanicsEquilibrium

def ExplicitSolidSolutionFoundationClosed (F : ExplicitSolidSolutionFoundation) : Prop :=
  ExplicitSolutionSolidModelClosed F.solidModel ∧
  SolutionExistenceModelClosed F.solutionExistence ∧
  EquilibriumSystemClassificationClosed F.equilibriumClassification ∧
  SolidMechanicsEquilibriumModelClosed F.solidMechanicsEquilibrium

theorem explicit_solid_solution_foundation_closed_from_evidence
    (F : ExplicitSolidSolutionFoundation) : ExplicitSolidSolutionFoundationClosed F := by
  exact And.intro (explicit_solution_solid_model_closed_from_evidence F.solidModel F.solidModelEvidence)
    (And.intro (solution_existence_model_closed_from_evidence F.solutionExistence F.solutionExistenceEvidence)
      (And.intro (equilibrium_system_classification_closed_from_evidence F.equilibriumClassification F.equilibriumClassificationEvidence)
        (solid_mechanics_equilibrium_model_closed_from_evidence F.solidMechanicsEquilibrium F.solidMechanicsEquilibriumEvidence)))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
