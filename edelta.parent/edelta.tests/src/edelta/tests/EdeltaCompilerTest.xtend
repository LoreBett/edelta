/*
 * generated by Xtext 2.10.0
 */
package edelta.tests

import com.google.common.base.Joiner
import com.google.inject.Inject
import org.eclipse.xtext.diagnostics.Severity
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.TemporaryFolder
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.resource.FileExtensionProvider
import org.eclipse.xtext.xbase.compiler.CompilationTestHelper
import org.eclipse.xtext.xbase.compiler.CompilationTestHelper.Result
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

import static extension org.junit.Assert.*

@RunWith(XtextRunner)
@InjectWith(EdeltaInjectorProviderCustom)
class EdeltaCompilerTest extends EdeltaAbstractTest {

	@Rule @Inject public TemporaryFolder temporaryFolder
	@Inject extension CompilationTestHelper
	@Inject private FileExtensionProvider extensionProvider

	@Test
	def void testEmptyProgram() {
		''''''.checkCompilation(
			'''
			package edelta;
			
			import edelta.lib.AbstractEdelta;
			import edelta.lib.EdeltaLibrary;
			import org.eclipse.xtext.xbase.lib.Extension;
			
			@SuppressWarnings("all")
			public class MyFile0 extends AbstractEdelta {
			  @Extension
			  private EdeltaLibrary lib;
			}
			'''
		)
	}

	@Test
	def void testProgramWithPackage() {
		'''
		package foo
		'''.checkCompilation(
			'''
			package foo;
			
			import edelta.lib.AbstractEdelta;
			import edelta.lib.EdeltaLibrary;
			import org.eclipse.xtext.xbase.lib.Extension;
			
			@SuppressWarnings("all")
			public class MyFile0 extends AbstractEdelta {
			  @Extension
			  private EdeltaLibrary lib;
			}
			'''
		)
	}

	@Test
	def void testOperationWithInferredReturnType() {
		operationWithInferredReturnType.checkCompilation(
			'''
			package foo;
			
			import edelta.lib.AbstractEdelta;
			import edelta.lib.EdeltaLibrary;
			import org.eclipse.xtext.xbase.lib.Extension;
			
			@SuppressWarnings("all")
			public class MyFile0 extends AbstractEdelta {
			  @Extension
			  private EdeltaLibrary lib;
			  
			  public boolean bar(final String s) {
			    return s.isEmpty();
			  }
			}
			'''
		)
	}

	@Test
	def void testOperationWithReturnType() {
		operationWithReturnType.checkCompilation(
			'''
			package foo;
			
			import edelta.lib.AbstractEdelta;
			import edelta.lib.EdeltaLibrary;
			import org.eclipse.xtext.xbase.lib.Extension;
			
			@SuppressWarnings("all")
			public class MyFile0 extends AbstractEdelta {
			  @Extension
			  private EdeltaLibrary lib;
			  
			  public boolean bar(final String s) {
			    return s.isEmpty();
			  }
			}
			'''
		)
	}

	@Test
	def void testOperationAccessingLib() {
		operationAccessingLib.checkCompilation(
			'''
			package foo;
			
			import edelta.lib.AbstractEdelta;
			import edelta.lib.EdeltaLibrary;
			import org.eclipse.emf.ecore.EClass;
			import org.eclipse.xtext.xbase.lib.Extension;
			
			@SuppressWarnings("all")
			public class MyFile0 extends AbstractEdelta {
			  @Extension
			  private EdeltaLibrary lib;
			  
			  public EClass bar(final String s) {
			    return this.lib.newEClass(s);
			  }
			}
			'''
		)
	}

	@Test
	def void testOperationNewEClassWithInitializer() {
		operationNewEClassWithInitializer.checkCompilation(
			'''
			package foo;
			
			import edelta.lib.AbstractEdelta;
			import edelta.lib.EdeltaLibrary;
			import java.util.function.Consumer;
			import org.eclipse.emf.common.util.EList;
			import org.eclipse.emf.ecore.EClass;
			import org.eclipse.xtext.xbase.lib.Extension;
			
			@SuppressWarnings("all")
			public class MyFile0 extends AbstractEdelta {
			  @Extension
			  private EdeltaLibrary lib;
			  
			  public EClass bar(final String s) {
			    final Consumer<EClass> _function = new Consumer<EClass>() {
			      public void accept(final EClass it) {
			        EList<EClass> _eSuperTypes = it.getESuperTypes();
			        EClass _newEClass = MyFile0.this.lib.newEClass("Base");
			        _eSuperTypes.add(_newEClass);
			      }
			    };
			    return this.lib.newEClass(s, _function);
			  }
			}
			'''
		)
	}

	@Test
	def void testProgramWithMainExpression() {
		programWithMainExpression.checkCompilation(
			'''
			package foo;
			
			import edelta.lib.AbstractEdelta;
			import edelta.lib.EdeltaLibrary;
			import org.eclipse.emf.ecore.EClass;
			import org.eclipse.xtext.xbase.lib.Extension;
			import org.eclipse.xtext.xbase.lib.InputOutput;
			
			@SuppressWarnings("all")
			public class MyFile0 extends AbstractEdelta {
			  @Extension
			  private EdeltaLibrary lib;
			  
			  public EClass bar(final String s) {
			    return this.lib.newEClass(s);
			  }
			  
			  @Override
			  public void execute() throws Exception {
			    EClass _bar = this.bar("foo");
			    InputOutput.<EClass>println(_bar);
			  }
			}
			'''
		)
	}

	@Test
	def void testCompilationOfEclassExpression() {
		eclassExpression.checkCompilation(
			'''
			package foo;
			
			import edelta.lib.AbstractEdelta;
			import edelta.lib.EdeltaLibrary;
			import org.eclipse.emf.ecore.EClass;
			import org.eclipse.xtext.xbase.lib.Extension;
			import org.eclipse.xtext.xbase.lib.InputOutput;
			
			@SuppressWarnings("all")
			public class MyFile0 extends AbstractEdelta {
			  @Extension
			  private EdeltaLibrary lib;
			  
			  @Override
			  public void execute() throws Exception {
			    InputOutput.<EClass>println(getEClass("foo", "FooClass"));
			  }
			}
			'''
		)
	}

	@Test
	def void testCompilationOfEclassExpressionWithNonExistantEClass() {
		"println(eclass Foo)".checkCompilation(
			'''
			package edelta;
			
			import edelta.lib.AbstractEdelta;
			import edelta.lib.EdeltaLibrary;
			import org.eclipse.emf.ecore.EClass;
			import org.eclipse.xtext.xbase.lib.Extension;
			import org.eclipse.xtext.xbase.lib.InputOutput;
			
			@SuppressWarnings("all")
			public class MyFile0 extends AbstractEdelta {
			  @Extension
			  private EdeltaLibrary lib;
			  
			  @Override
			  public void execute() throws Exception {
			    InputOutput.<EClass>println(getEClass("null", "null"));
			  }
			}
			''',
			false
		)
	}

	def private checkCompilation(CharSequence input, CharSequence expectedGeneratedJava) {
		checkCompilation(input, expectedGeneratedJava, true)
	}

	def private checkCompilation(CharSequence input, CharSequence expectedGeneratedJava,
		boolean checkValidationErrors) {
		val rs = createResourceSet(input)
		rs.compile [
			if (checkValidationErrors) {
				assertNoValidationErrors
			}

			if (expectedGeneratedJava != null) {
				assertGeneratedJavaCode(expectedGeneratedJava)
			}

			if (checkValidationErrors) {
				assertGeneratedJavaCodeCompiles
			}
		]
	}

	private def assertNoValidationErrors(Result it) {
		val allErrors = getErrorsAndWarnings.filter[severity == Severity.ERROR]
		if (!allErrors.empty) {
			throw new IllegalStateException(
				"One or more resources contained errors : " + Joiner.on(',').join(allErrors)
			);
		}
	}

	def private assertGeneratedJavaCode(CompilationTestHelper.Result r, CharSequence expected) {
		expected.toString.assertEquals(r.singleGeneratedCode)
	}

	def private assertGeneratedJavaCodeCompiles(CompilationTestHelper.Result r) {
		r.compiledClass // check Java compilation succeeds
	}

	def private createResourceSet(CharSequence... inputs) {
		val pairs = newArrayList() => [
			list |
			inputs.forEach[e, i|
				list += "MyFile" + i + "." + 
					extensionProvider.getPrimaryFileExtension() -> e
			]
		]
		val rs = resourceSet(pairs)
		addEPackageForTests(rs)
		return rs
	}
}
