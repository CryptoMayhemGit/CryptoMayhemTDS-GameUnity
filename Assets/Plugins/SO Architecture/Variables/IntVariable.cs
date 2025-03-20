[UnityEngine.CreateAssetMenu(menuName = SOArchitectureDirectories.VARIABLE_SUBMENU + "Int")]
public class IntVariable : NumericStructVariable<int>
{
    public override void Add(int t)
    {
        Value += t;
    }

    public override void Divide(int t)
    {
        Value /= t;
    }

    public override void Multiply(int t)
    {
        Value *= t;
    }

    public override void Subtract(int t)
    {
        Value -= t;
    }
}