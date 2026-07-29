import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure ExplicitSolutionKernelPackage where
  kernelFunction : Type u
  integralOperator : Prop
  resolventEquation : Prop
  closedFormExpression : Prop
  numericalStability : Prop

structure ExplicitSolutionKernelEvidence (K : ExplicitSolutionKernelPackage) where
  integralOperatorClosed : K.integralOperator
  resolventEquationClosed : K.resolventEquation
  closedFormExpressionClosed : K.closedFormExpression
  numericalStabilityClosed : K.numericalStability

def ExplicitSolutionKernelClosed (K : ExplicitSolutionKernelPackage) : Prop :=
  K.integralOperator ∧ K.resolventEquation ∧ K.closedFormExpression ∧ K.numericalStability

theorem explicit_solution_kernel_closed_from_evidence (K : ExplicitSolutionKernelPackage) (E : ExplicitSolutionKernelEvidence K) : ExplicitSolutionKernelClosed K := by
  exact And.intro E.integralOperatorClosed (And.intro E.resolventEquationClosed (And.intro E.closedFormExpressionClosed E.numericalStabilityClosed))

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse