/*
 * generated by Xtext 2.10.0
 */
package edelta.tests

import com.google.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.xbase.typesystem.IBatchTypeResolver
import org.junit.Test
import org.junit.runner.RunWith

import static extension org.junit.Assert.*
import org.eclipse.emf.ecore.EClass
import org.eclipse.emf.ecore.EClassifier
import org.eclipse.emf.ecore.EDataType
import org.eclipse.emf.ecore.EStructuralFeature
import org.eclipse.emf.ecore.EAttribute
import org.eclipse.emf.ecore.EReference

@RunWith(XtextRunner)
@InjectWith(EdeltaInjectorProvider)
class EdeltaTypeComputerTest extends EdeltaAbstractTest {

	@Inject extension IBatchTypeResolver

	@Test
	def void testTypeOfEclassifierExpression() {
		"eclassifier FooClass".assertType(EClassifier)
	}

	@Test
	def void testTypeOfEclassExpression() {
		"eclass FooClass".assertType(EClass)
	}

	@Test
	def void testTypeOfEDatatyeExpression() {
		"edatatype FooDataType".assertType(EDataType)
	}

	@Test
	def void testTypeOfEFeatureExpression() {
		"efeature myAttribute".assertType(EStructuralFeature)
	}

	@Test
	def void testTypeOfEAttributeExpression() {
		"eattribute myAttribute".assertType(EAttribute)
	}

	@Test
	def void testTypeOfEReferenceExpression() {
		"ereference myReference".assertType(EReference)
	}

	@Test
	def void testTypeOfCreateEClassExpression() {
		"createEClass Test in foo".assertType(EClass)
	}

	def private assertType(CharSequence input, Class<?> expected) {
		input.parseWithTestEcore.lastExpression => [
			expected.canonicalName.assertEquals(
				resolveTypes.getActualType(it).identifier
			)
		]
	}

}
