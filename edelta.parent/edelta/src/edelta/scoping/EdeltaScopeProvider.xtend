/*
 * generated by Xtext 2.10.0
 */
package edelta.scoping

import com.google.inject.Inject
import edelta.edelta.EdeltaEcoreQualifiedReference
import edelta.util.EdeltaEcoreHelper
import edelta.util.EdeltaModelUtil
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EReference
import org.eclipse.xtext.scoping.Scopes
import org.eclipse.xtext.scoping.impl.FilteringScope
import org.eclipse.xtext.util.IResourceScopeCache

import static edelta.edelta.EdeltaPackage.Literals.*

/**
 * This class contains custom scoping description.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#scoping
 * on how and when to use it.
 */
class EdeltaScopeProvider extends AbstractEdeltaScopeProvider {

	@Inject IResourceScopeCache cache
	@Inject extension EdeltaModelUtil
	@Inject extension EdeltaEcoreHelper

	override getScope(EObject context, EReference reference) {
		if (reference == EDELTA_ECORE_REFERENCE__ENAMEDELEMENT) {
			if (context instanceof EdeltaEcoreQualifiedReference) {
				return Scopes.scopeFor(getENamedElements(context.qualification.enamedelement, context))
			}
			return Scopes.scopeFor(getProgramENamedElements(context))
		} else if (reference == EDELTA_ECORE_BASE_ECLASS_MANIPULATION_WITH_BLOCK_EXPRESSION__EPACKAGE) {
			return Scopes.scopeFor(getProgram(context).metamodels)
		} else if (reference == EDELTA_ECORE_CHANGE_ECLASS_EXPRESSION__ORIGINAL) {
			return Scopes.scopeFor(getChangeEClass(context).epackage.allEClasses)
		} else if (reference == EDELTA_PROGRAM__METAMODELS) {
			return cache.get("scopeMetamodels", context.eResource) [
				return new FilteringScope(delegateGetScope(context, reference)) [
					"false".equals(getUserData("nsURI"))
				]
			]
		}
		super.getScope(context, reference)
	}

}
