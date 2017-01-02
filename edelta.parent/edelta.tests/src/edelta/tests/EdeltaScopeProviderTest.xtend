/*
 * generated by Xtext 2.10.0
 */
package edelta.tests

import com.google.inject.Inject
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EReference
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.scoping.IScopeProvider
import org.junit.Test
import org.junit.runner.RunWith

import static extension org.junit.Assert.*
import edelta.edelta.EdeltaPackage

@RunWith(XtextRunner)
@InjectWith(EdeltaInjectorProviderCustom)
class EdeltaScopeProviderTest extends EdeltaAbstractTest {

	@Inject extension IScopeProvider

	@Test
	def void testScopeForMetamodel() {
		referenceToMetamodel.parseWithTestEcore.
			assertScope(EdeltaPackage.eINSTANCE.edeltaProgram_Metamodels,
			"foo")
		// we skip nsURI references, like http://foo
	}

	@Test
	def void testScopeForEClassifier() {
		referenceToMetamodel.parseWithTestEcore.
			assertScope(EdeltaPackage.eINSTANCE.edeltaEClassifierExpression_Eclassifier,
			"FooClass, FooDataType")
		// we skip nsURI references, like http://foo
	}

	@Test
	def void testScopeForEClass() {
		referenceToMetamodel.parseWithTestEcore.
			assertScope(EdeltaPackage.eINSTANCE.edeltaEClassExpression_Eclass,
			"FooClass")
		// we skip nsURI references, like http://foo
	}

	@Test
	def void testScopeForEDataType() {
		referenceToMetamodel.parseWithTestEcore.
			assertScope(EdeltaPackage.eINSTANCE.edeltaEDataTypeExpression_Edatatype,
			"FooDataType")
		// we skip nsURI references, like http://foo
	}

	@Test
	def void testScopeForEAttribute() {
		referenceToMetamodel.parseWithTestEcore.
			assertScope(EdeltaPackage.eINSTANCE.edeltaEAttributeExpression_Eattribute,
			"myAttribute")
		// we skip nsURI references, like http://foo
	}

	@Test
	def void testScopeForEReference() {
		referenceToMetamodel.parseWithTestEcore.
			assertScope(EdeltaPackage.eINSTANCE.edeltaEReferenceExpression_Ereference,
			"myReference")
		// we skip nsURI references, like http://foo
	}

	@Test
	def void testScopeForEFeature() {
		referenceToMetamodel.parseWithTestEcore.
			assertScope(EdeltaPackage.eINSTANCE.edeltaEFeatureExpression_Efeature,
			"myAttribute, myReference")
		// we skip nsURI references, like http://foo
	}

	@Test
	def void testScopeForCreateEClassPackage() {
		createEClass.parseWithTestEcore.lastExpression.
			assertScope(EdeltaPackage.eINSTANCE.edeltaEcoreCreateEClassExpression_Epackage,
			"foo")
		// we skip nsURI references, like http://foo
	}

	def private assertScope(EObject context, EReference reference, CharSequence expected) {
		expected.toString.assertEquals(
			context.getScope(reference).
				allElements.
				map[name].join(", ")
		)
	}
}
