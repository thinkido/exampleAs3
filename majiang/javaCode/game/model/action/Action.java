
package game.model.action;

public abstract class Action
{

	public abstract void onStart();

	public abstract void onComplete();

	public abstract boolean onStep();

	public abstract Action getReverseAction();

	public abstract void onDispose();
}
