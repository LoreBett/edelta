/**
 * 
 */
package edelta.interpreter;

import org.apache.log4j.Logger;

import edelta.edelta.EdeltaProgram;
import edelta.util.EdeltaCopiedEPackagesMap;

/**
 * An interpreter that swallows all {@link RuntimeException}s except for
 * {@link EdeltaInterpreterRuntimeException}.
 * 
 * @author Lorenzo Bettini
 *
 */
public class EdeltaSafeInterpreter extends EdeltaInterpreter {

	private static final Logger LOG = Logger.getLogger(EdeltaSafeInterpreter.class);

	/**
	 * Subclasses of this exception will always be rethrown by the safe interpreter.
	 * 
	 * @author Lorenzo Bettini
	 *
	 */
	public static class EdeltaInterpreterRuntimeException extends RuntimeException {

		private static final long serialVersionUID = 1L;

		/**
		 * @param message
		 */
		public EdeltaInterpreterRuntimeException(String message) {
			super(message);
		}

	}

	@Override
	@SuppressWarnings("all") // avoid warning for nested try block
	public void evaluateModifyEcoreOperations(EdeltaProgram program,
			EdeltaCopiedEPackagesMap copiedEPackagesMap) {
		try {
			try {
				super.evaluateModifyEcoreOperations(program, copiedEPackagesMap);
			} catch (EdeltaInterpreterWrapperException e) {
				throw e.getException();
			}
		} catch (EdeltaInterpreterRuntimeException e) {
			throw e;
		} catch (RuntimeException e) {
			LOG.debug("while interpreting", e);
		} catch (Exception e) {
			LOG.warn("result of interpreting", e);
		}
	}

}
